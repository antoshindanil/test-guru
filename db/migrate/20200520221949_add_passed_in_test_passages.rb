# frozen_string_literal: true

class AddPassedInTestPassages < ActiveRecord::Migration[6.0]
  def change
    add_column :test_passages, :passed, :boolean, default: false
  end
end
