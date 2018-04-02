ActiveAdmin.register Notification, :as => "Notify" do
	menu priority: 6
	permit_params :recipient_id, :actor_id, :read_at, :action, :notifiable_id, :notifiable_type
end
