class PostCommentsController < ApplicationController
	before_action :authenticate_user!, only: :create
	before_action :is_owner?, only: :destroy

	def create
	  @post = Post.find(params[:post_id])
	  @post_comment = @post.post_comments.create(comment_params.merge(user_id: current_user.id))
	  
	  # create notifications for post owner
	  if !@post.users.exists?(@post.user_id)
	  	Notification.create(recipient: @post.user, actor: current_user, action: "comment", notifiable: @post_comment)
	  end

	  # create notifications for users involving in comment
	  (@post.users.uniq - [current_user]).each do |user|
        Notification.create(recipient: user, actor: current_user, action: "comment", notifiable: @post_comment)
      end

	  respond_to do |format|
		  format.html { redirect_to posts_path }
		  format.js {}
		end
	end

	def destroy
	  @post_comment = PostComment.find(params[:id])
	  @post_comment.destroy
	  
	  respond_to do |format|
		  format.html { redirect_to posts_path }
		  format.js {}
		end
	end

	private 

	def is_owner?
	  @post_comment = PostComment.find(params[:id])
	  if @post_comment.user != current_user
	    redirect_to root_path
	  end
	end

	def comment_params
	  params.require(:post_comment).permit(:text, :post_id)
	end
end
