ActiveAdmin.register Post do
	permit_params :user, :photo, :description
	
	filter :user
	filter :photo
	filter :description

	index do
	  selectable_column
	  column :id
	  column :photo do |post|
	  	cl_image_tag(post.photo)
	  end
	  column :description
	  column :user
	  actions
	end
end
