ActiveAdmin.register User do
	menu priority: 4
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :name, :email, :password, :password_confirmation, :photo
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
	  id_column
	  column :name, :sortable => :name
	  column 'Profile Picture', :photo do |prof_pic|
	  	cl_image_tag(prof_pic.photo)
	  end
	  column :email
	  column :sign_in_count
	  column :created_at
	  column :current_sign_in_at
	  actions
	end

	form do |f|
		f.inputs "Admin Details" do
	      f.input :name
	      f.input :email
	      f.input :password
	      f.input :password_confirmation
	      f.input :photo, :label => 'Profile Picture'
	    end
	    f.actions
	end

end
