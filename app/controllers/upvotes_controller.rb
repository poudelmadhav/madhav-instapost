class UpvotesController < ApplicationController
	before_action :authenticate_user!

	def create
		 @post = Post.find(params[:post_id])
		 @post.liked_by current_user

		 # create notification
		 Notification.create(recipient: @post.user, actor: current_user, action: "like", notifiable: @post)

		 respond_to do |format|
		  format.html { redirect_to posts_path }
		  format.js {}
		end
	end	
end
