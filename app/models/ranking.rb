# frozen_string_literal: true

class Ranking < ApplicationRecord

  belongs_to :user
  belongs_to :post

end
