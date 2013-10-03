class Admin::PostsController < Admin::HomeController
  before_filter :find_post, only: [:update, :edit, :destroy, :publish, :unpublish]

  def index
    @posts = Post.all
  end

  def update
    if @post.update_attributes(params[:post])
      redirect_to [:edit, :admin, @post], notice: "Информация о посте '#{@post.content.name}' успешно обновлена"
    else
      render 'edit'
    end
  end

  def edit
  end

  def publish
    @post.moderation = 2
    if @post.save
      redirect_to admin_posts_path, notice: "Пост ##{@post.id} успешно опубликован"
    else
      redirect_to [:edit, :admin, @post], alert: 'Опс, что то пошло не так'
    end
  end

  def unpublish
    @post.moderation = 1
    if @post.save
      redirect_to admin_posts_path, notice: "Пост ##{@post.id} успешно снят с публикации"
    else
      redirect_to [:edit, :admin, @post], alert: 'Опс, что то пошло не так'
    end
  end

  def destroy
    @post.destroy
    redirect_to admin_posts_path, notice: "Пост ##{@post.id} - '#{@post.title}' успешно удален"
  end

  private
    def find_post
      @post = Post.find(params[:id])
    end
end