# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :author, class_name: "User"
  belongs_to :category
  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages, dependent: :destroy

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :complex, -> { where(level: 5..Float::INFINITY) }
  scope :with_questions, -> { joins(:questions).group("tests.id") }
  scope :by_category_title, -> (category_title) { joins(:category).where("categories.title" => category_title) }


  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def self.tests_by_category (category_title)
    by_category_title(category_title).order(title: :desc)
  end
end
