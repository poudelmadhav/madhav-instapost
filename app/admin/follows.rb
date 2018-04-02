ActiveAdmin.register Follow do
	menu priority: 5
	permit_params :follower_id, :followed_id
end
