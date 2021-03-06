class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :full
      t.text :intro
      t.string :title
      t.integer :moderation, default: 0
      t.integer :user_id
      t.integer :admin_user_id
      t.integer :category_id

      t.timestamps
    end

    add_index :posts, :user_id
    add_index :posts, :admin_user_id
    add_index :posts, :category_id
  end
end
