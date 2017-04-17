ActiveAdmin.register User do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

	filter :email
	filter :name

	index do
	  selectable_column
	  column :id, :sortable => :id
	  column :name, :sortable => :name
	  column :photo do |prof_pic|
	  	cl_image_tag(prof_pic.photo)
	  end
	  column :email
	  column :password
	  column :sign_in_count
	  column :created_at
	  column :last_sign_in_at
	  actions
	end

end
