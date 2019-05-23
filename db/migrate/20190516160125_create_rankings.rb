# frozen_string_literal: true

class CreateRankings < ActiveRecord::Migration[5.2]
  def change
    create_table :rankings do |t|
      t.integer :rank, null: false, default: 0
      t.timestamps null: false
    end

    add_reference :rankings, :user, foreign_key: true
    add_reference :rankings, :post, foreign_key: true
  end
end
