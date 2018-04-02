ActiveAdmin.register PostComment do
	menu priority: 4
	permit_params :post_id, :user_id, :text
end
