class CreateTableCategoriesPosts < ActiveRecord::Migration
  def change
  	create_table :categories_posts do |t|
  		t.integer :category_id
  		t.integer :post_id
  	end

  	add_index :categories_posts, :category_id
  	add_index :categories_posts, :post_id

  	remove_index :posts, :category_id
  	remove_column :posts, :category_id
  end
end
