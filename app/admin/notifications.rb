ActiveAdmin.register Notification do
	scope :all, default: true
	permit_params :recipient_id, :actor_id, :read_at, :action, :notifiable_id, :notifiable_type
end
