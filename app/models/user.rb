class User < ApplicationRecord
  has_many :author, class_name: 'Test'
  has_many :tests_users
  has_many :tests, through: :tests_users

  def passed_tests (level)
    tests.where(level: level)
  end
end
