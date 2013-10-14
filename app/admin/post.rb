ActiveAdmin.register Post do
  # post status
  # 0 - ждет модерации
  # 1 - отклонено модератором
  # 2 - принято модератором
  menu :priority => 2

  scope_to :current_user, if: proc { admin_user_signed_in? }

  index do
    column :id
    column :moderation do |post|
      case post.moderation.to_i
        when 0 then raw "#{link_to('Отклонить', moderation_admin_post_admin_post_path(post, status: 1))} #{link_to('Одобрить', moderation_admin_post_admin_post_path(post, status: 2))}" 
        when 1 then link_to 'Одобрить', moderation_admin_post_admin_post_path(post, status: 2)
        when 2 then link_to 'Отклонить', moderation_admin_post_admin_post_path(post, status: 1)
      end
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

  member_action :moderation_admin_post, method: :get do
    @post = Post.find(params[:id])
    @post.update_attribute(:moderation, params[:status])
    
    # если админ одобрил пост, он считается новым и отсылается всем подписанным на его категорию юзерам
    if params[:status].to_i == 2
      # пробигаемся по всем категориям поста, т.к. они принадлежат многие ко многим к категориям
      @post.categories.each do |category|
        category.subscriptions.each do |subscr|
          UserSubscriptions.delay.send_post_user_signed(subscr.user, @post, category)
        end
      end
    end

    redirect_to admin_posts_path, notice: "Статус для поста #{@post.title} успешно изменен"
  end

  controller do
    def scoped_collection
      Post.includes(:user, :categories)
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
