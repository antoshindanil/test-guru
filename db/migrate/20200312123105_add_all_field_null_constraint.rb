# frozen_string_literal: true

class AddAllFieldNullConstraint < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:answers, :body, false)
    change_column_null(:categories, :title, false)
    change_column_null(:categories, :title, false)
    change_column_null(:users, :username, false)
    change_column_null(:users, :password, false)
    change_column_null(:tests, :title, false)
  end
end
