# frozen_string_literal: true

class AddCategoriesTitleNullConstraint < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:categories, :title, false)
  end
end
