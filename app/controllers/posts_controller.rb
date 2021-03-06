class PostsController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create]
	before_action :is_owner?, only: [:edit, :update, :destroy]

	def index
	  @posts = Post.order('created_at DESC').paginate(page: params[:page]).includes(:user, post_comments: :user)
	  respond_to do |format|
	      format.html
	      format.js
	    end
	end

	def new
	  @post = Post.new
	end

	def create
	  @post = current_user.posts.create(post_params)
	  if @post.valid?
	  	flash[:success] = "Your post has been successfully posted!"
	    redirect_to root_path
	  else
	  	flash[:alert] = "#{@post.errors.full_messages.join(',')}"
	    render :new, status: :unprocessable_entity
	  end
	end

	def edit
	  @post = Post.find(params[:id])
	end

	def update
	  @post = Post.find(params[:id])
	  @post.update(post_params)
	  if @post.valid?
	  	flash[:success] = "Your post has been successfully updated!"
	    redirect_to root_path
	  else
	  	flash[:alert] = "Woops! Looks like there has been an error!"
	    render :edit, status: :unprocessable_entity
	  end
	end

	def show
	  @post = Post.find(params[:id])
	end

	def destroy
	  @post = Post.find(params[:id])
	  @post.destroy
	  flash[:success] = "The post was successfully deleted!"
	  redirect_to root_path
	end
	
	private

	def is_owner?
	  redirect_to root_path if Post.find(params[:id]).user != current_user
	end

	def post_params
	  params.require(:post).permit(:user_id, :photo, :description)
	end
end
