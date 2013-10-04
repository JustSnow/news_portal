ActiveAdmin.register Category do
  menu :priority => 3

  index do
    column :id
    column :name do |category|
      link_to category.name, [:edit, :admin, category]
    end
  end

  filter :name
  filter :created_at

  controller do
    def new
      @category = current_admin_user.posts.build
    end

    def create
      @category = current_admin_user.posts.build(params[:post])
      
      if @category.save
        redirect_to [:edit, :admin, @category], notice: 'Category was successfully created.'
      else
        render 'edit'
      end
    end
  end
end
