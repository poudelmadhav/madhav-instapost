ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    section "Recent Active Users", :priority => 1 do
        table_for User.order("current_sign_in_at DESC").limit(5) do
            column :id
            column "Name", :name do |user|
                link_to user.name, [:admin, user]
            end
            column :email
            column :created_at
            column :last_sign_in_at
        end
    end

    section "Recent Posts", :priority => 1 do
        table_for Post.order("id DESC").limit(5) do
            column :id
            column "Name", :post do |post|
                link_to post.user_name,  admin_user_path(post.user_id)
            end
            column :photo do |post|
                link_to [:admin, post] do
                    cl_image_tag(post.photo)
                end
            end
            column :description
        end
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
