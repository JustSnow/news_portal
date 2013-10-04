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
end
