class CreateTableSubscriptions < ActiveRecord::Migration
  def change
  	create_table :subscriptions do |t|
  		t.string :name
  		t.integer :category_id
  		t.integer :user_id

  		t.timestamps
  	end

  	add_index :subscriptions, :category_id
  	add_index :subscriptions, :user_id
  end
end
