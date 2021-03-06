# frozen_string_literal: true

class AddEmailToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :email, :string, unique: true
    change_column :users, :email, :string, null: false
  end
end
