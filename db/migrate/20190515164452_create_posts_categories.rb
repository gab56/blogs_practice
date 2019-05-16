# frozen_string_literal: true

class CreatePostsCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :posts_categories, &:timestamps

    add_reference :posts_categories, :post, foreign_key: true
    add_reference :posts_categories, :category, foreign_key: true
  end
end
