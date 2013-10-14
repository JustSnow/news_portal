ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do

    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
      column do
        para "Count Posts (#{Post.all.size})"    
        para "Count User (#{User.all.size})"
        para "Count User Today (#{User.today_users.size})"
      end
    end
  end # content
end
