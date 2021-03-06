class NotificationsController < ApplicationController
	before_action :authenticate_user!
	skip_before_action :verify_authenticity_token
	
	def index
		@notifications = Notification.where(recipient: current_user).order(created_at: :desc).paginate(page: params[:page])
		@recent_notifications = Notification.where(recipient: current_user).recent
	end

	def mark_as_read
		@notifications = Notification.where(recipient: current_user).unread
		@notifications.update_all(read_at: Time.zone.now)
		render json: {success: true}
	end
end
