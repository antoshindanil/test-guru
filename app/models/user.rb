# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable,
    :registerable,
    :recoverable,
    :rememberable,
    :validatable,
    :confirmable

  has_many :author, class_name: "Test"
  has_many :test_passages
  has_many :tests, through: :test_passages

  validates :email, presence: true,
    format: { with: /\A[^@\s]+@[^@\s]+\z/ },
    uniqueness: true

  def passed_tests (level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    is_a?(Admin)
  end
end
