class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :full
      t.text :intro
      t.string :title

      t.timestamps
    end
  end
end
