ActiveAdmin.register Post do
  index do
    column :id
    column :title do |post|
      link_to post.title, [:edit, :admin, post]
    end
    column :intro
    column :full
    column :user
  end

  form partial: "form"
end
