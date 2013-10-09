class AddColumnPostsPreview < ActiveRecord::Migration
  def change
    add_column :posts, :preview, :boolean, default: false
  end
end
