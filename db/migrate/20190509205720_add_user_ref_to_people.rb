# frozen_string_literal: true

class AddUserRefToPeople < ActiveRecord::Migration[5.2]
  def change
    add_reference :people, :user, foreign_key: true
  end
end
