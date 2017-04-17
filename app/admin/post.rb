ActiveAdmin.register Post do
	permit_params :user, :photo, :description
	
	filter :user
	filter :photo
	filter :description

	index do
	  selectable_column
	  column :id, :sortable => :id
	  column :photo do |prof_pic|
	  	cl_image_tag(prof_pic.photo)
	  end
	  column :description
	  column :user, :sortable => :user
	  actions
	end
end
