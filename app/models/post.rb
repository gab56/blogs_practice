# frozen_string_literal: true

class Post < ApplicationRecord

  belongs_to :user
  has_many :posts_categories, dependent: :destroy
  has_many :categories, through: :posts_categories

  accepts_nested_attributes_for :categories

end
