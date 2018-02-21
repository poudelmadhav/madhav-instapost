ActiveAdmin.register Follow do
	permit_params :follower_id, :followed_id
end
