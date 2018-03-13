class NotificationsController < ApplicationController
	before_action :authenticate_user!
	
	def index
		@notification = Notification.where(recipient: current_user).unread
	end
end
