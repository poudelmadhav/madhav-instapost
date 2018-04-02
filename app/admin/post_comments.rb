ActiveAdmin.register PostComment do
	permit_params :post_id, :user_id, :text
end
