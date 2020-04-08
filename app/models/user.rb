# frozen_string_literal: true

class User < ApplicationRecord
  has_many :author, class_name: "Test"
  has_many :test_passages
  has_many :tests, through: :test_passages
  EMAIL_REGEX = ""

  validates :email, presence: true,
    format: { with: /\A[^@\s]+@[^@\s]+\z/ },
    uniqueness: true

  has_secure_password

  def passed_tests (level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
