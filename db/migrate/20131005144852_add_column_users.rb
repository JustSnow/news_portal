class AddColumnUsers < ActiveRecord::Migration
  def change
  	add_column :users, :username, :string
  	add_column :users, :nickname, :string
  	add_column :users, :provider, :string
  	add_column :users, :url, :string
  end
end
