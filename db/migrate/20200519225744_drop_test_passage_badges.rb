class DropTestPassageBadges < ActiveRecord::Migration[6.0]
  def change
    drop_table :test_passage_badges
  end
end
