ActiveAdmin.register Post do
  index do
    column :id
    column :moderation
    column :title do |post|
      link_to post.title, [:edit, :admin, post]
    end
    column :intro
    column :full
    column :user
  end

  filter :created_at

  form partial: "form"
end
