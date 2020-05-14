# frozen_string_literal: true

class AddColumnAuthorIdToTests < ActiveRecord::Migration[6.0]
  def change
    add_column :tests, :author_id, :integer
  end
end
