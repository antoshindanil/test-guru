# frozen_string_literal: true

class CreateTestPassageBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :test_passage_badges do |t|
      t.references :test_passage, foreign_key: true
      t.references :badge, foreign_key: true

      t.timestamps
    end
  end
end
