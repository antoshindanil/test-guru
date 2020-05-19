# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable,
    :registerable,
    :recoverable,
    :rememberable,
    :validatable,
    :confirmable

  has_many :authors, class_name: "Test", foreign_key: :author_id, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages, dependent: :destroy
  has_many :gists, dependent: :destroy
  has_many :feedbacks, dependent: :destroy
  has_many :user_badges
  has_many :badges, through: :user_badges

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

  def passed_tests?(test_ids)
    passed_test_ids = test_passages.where(test_id: test_ids).select(&:success?).map(&:test_id)
    test_ids.uniq.sort == passed_test_ids.uniq.sort
  end
end
