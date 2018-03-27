class FollowsController < ApplicationController
	before_action :authenticate_user!
	before_action :check_user

	def create
		@follows = current_user.follow(@user)
		@follows.save
		Notification.create(recipient: @user, actor: current_user, action: 'followed you.', notifiable: @follows)
		respond_to do |format|
            format.html { redirect_to user_path(@user.id) }
            format.js {}
        end
	end

	def destroy
	  current_user.unfollow(@user)
	  # @notification = Notification.where(actor: current_user)
	  # @notification.destroy
	  respond_to do |format|
            format.html { redirect_to user_path(@user.id) }
            format.js {}
      end
	end

	private

	def check_user
		@user = User.find(params[:id])
		if @user == current_user
			flash[:alert] = "Opps! You are trying to follow yourself!"
			render :js => "window.location.reload()"
		end
	end
end
