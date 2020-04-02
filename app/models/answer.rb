# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validates :body, presence: true
  validate :validate_count, on: :create

  private
    def validate_count
      errors.add(:base, "More than 4 answers") if question.answers.size > 4
    end
end
