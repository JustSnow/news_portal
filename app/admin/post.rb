ActiveAdmin.register Post do
  menu :priority => 2

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

  controller do
    def new
      @post = current_admin_user.posts.build
    end

    def create
      @post = current_admin_user.posts.build(params[:post])
      
      if @post.save
        redirect_to [:edit, :admin, @post], notice: 'Post was successfully created.'
      else
        render 'edit'
      end
    end
  end
end