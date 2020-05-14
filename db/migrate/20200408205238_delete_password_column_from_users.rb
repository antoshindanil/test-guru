# frozen_string_literal: true

class DeletePasswordColumnFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :password, :string, null: false
  end
end
