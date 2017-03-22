class UpvotesController < ApplicationController
	before_action :authenticate_user!

	def create
		 @post = Post.find(params[:post_id])
		 @post.liked_by current_user
		 flash[:success] = "The post has been liked!"
		 redirect_to posts_path
	end	
end
