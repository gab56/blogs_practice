# frozen_string_literal: true

class Category < ApplicationRecord

  has_many :postsCategories, dependent: :destroy
  has_many :posts, through: :postsCategories

end
