# frozen_string_literal: true

class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.integer :identificacion, null: false, default: 0
      t.string :phone_number, limit: 9, null: false, default: ""
      t.string :first_name, null: false, default: ""
      t.string :last_name, null: false, default: ""
      t.timestamps null: false
    end

    add_reference :people, :user, foreign_key: true, index: { unique: true }
  end
end
