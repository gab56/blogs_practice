class RemoveOpenedFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :opened, :boolean
    add_column :posts, :opened, :boolean, null: false, default: false
  end
end
