ActiveAdmin.register Notification, :as => "Notify" do
	permit_params :recipient_id, :actor_id, :read_at, :action, :notifiable_id, :notifiable_type
end
