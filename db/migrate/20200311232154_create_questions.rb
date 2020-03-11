class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.body :string
      t.test_id :integer

      t.timestamps
    end
  end
end
