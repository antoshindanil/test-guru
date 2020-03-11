class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.body :text
      t.question_id :integer

      t.timestamps
    end
  end
end
