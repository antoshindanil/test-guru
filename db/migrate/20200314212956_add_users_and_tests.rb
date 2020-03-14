class AddUsersAndTests < ActiveRecord::Migration[6.0]
  def change
    create_table :users_tests do |t|
      t.belongs_to :user
      t.belongs_to :test
    end
  end
end
