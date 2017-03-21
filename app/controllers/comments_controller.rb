class CommentsController < ApplicationController
	before_action :authenticate_user!, only: :create
	before_action :is_owner?, only: :destroy

	def create
	  @post = Post.find(params[:post_id])
	  @comment = @post.comments.create(comment_params.merge(user_id: current_user.id))
	  if @comment.valid?
	    redirect_to root_path
	  else
	    flash[:alert] = "Invalid attributes."
	    redirect_to root_path
	  end
	end

	def destroy
	  @comment = Comment.find(params[:id])
	  @comment.destroy
	  redirect_to root_path
	end

	private 

	def is_owner?
	  @comment = Comment.find(params[:id])
	  if @comment.user != current_user
	    redirect_to root_path
	  end
	end

	def comment_params
	  params.require(:comment).permit(:text, :post_id)
	end
end
