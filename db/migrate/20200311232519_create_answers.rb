# frozen_string_literal: true

class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.text :body
      t.references :question, foreign_key: true

      t.boolean :correct

      t.timestamps
    end
  end
end
