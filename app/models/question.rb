# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :test
  has_many :answers, dependent: :destroy
  has_many :gists, dependent: :destroy
  has_many :test_passages, foreign_key: :current_question_id, dependent: :destroy

  validates :body, presence: true

  MAX_ANSWERS_COUNT = 4

  def valid_count?
    if self.answers.count < MAX_ANSWERS_COUNT
      true
    else
      false
    end
  end
end
