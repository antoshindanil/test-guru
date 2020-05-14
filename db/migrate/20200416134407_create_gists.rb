# frozen_string_literal: true

class CreateGists < ActiveRecord::Migration[6.0]
  def change
    create_table :gists do |t|
      t.references :question, null: false, foreign_key: true
      t.string :github_id
      t.references :user, null: false, foreign_key: true
    end
  end
end
