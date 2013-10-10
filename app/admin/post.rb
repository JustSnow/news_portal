ActiveAdmin.register Post do
  menu :priority => 2

  scope_to :current_user, if: proc { admin_user_signed_in? }

  index do
    column :id
    column :moderation do |post|
      post.moderation_name post.moderation
    end
    column :title do |post|
      link_to post.title, [:edit, :admin, post]
    end
    column :intro
    column :full
    column :user do |post|
      post.user.try(:email)
    end
    default_actions
  end

  filter :created_at

  form partial: "form"

  controller do
    def scoped_collection
      Post.includes(:user, :category)
    end

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

    def update
      @post = Post.find(params[:id])
      changed_moderation = (@post.moderation.to_i === params[:post][:moderation].to_i)? false : true

      if @post.update_attributes(params[:post])
        PostModeration.delay.result_moderation_post(@post) if changed_moderation
        redirect_to [:edit, :admin, @post], notice: 'Post was successfully updated.'
      else
        render 'edit'
      end
    end
  end
end
