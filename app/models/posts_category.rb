# frozen_string_literal: true

class PostsCategory < ApplicationRecord

  belongs_to :post
  belongs_to :category

  validates :post, presence: true
  validates :category, presence: true

end
