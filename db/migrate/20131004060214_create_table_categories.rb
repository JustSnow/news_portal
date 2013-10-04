class CreateTableCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :admin_user_id

      t.timestamps
    end 

    add_index :categories, :admin_user_id
  end
end
