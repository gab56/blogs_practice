class CreatePost < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title, :limit => 100, null: false, default: ""
      t.text :content, null: false, default: ""
      t.boolean :opened, default: true
      t.timestamps null: false
    end
  end
end
