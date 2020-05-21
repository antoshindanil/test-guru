# frozen_string_literal: true

class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: "Question", optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_update :before_update_set_next_question

  SUCCES_TEST_PERCENT = 85

  def completed?
    current_question.nil?
  end

  def current_questions_percent
    if correct_questions
      correct_questions.to_f / test.questions.size * 100
    end
  end

  def success?
    current_questions_percent >= SUCCES_TEST_PERCENT && timeout?
  end

  def fail?
    !success?
  end

  def timeout?
    if test.timer > 0
      (created_at + test.timer.minutes) > (Time.current.in_time_zone 0000)
    else
      true
    end
  end

  def current_question_number
    if test.questions.index(current_question)
      test.questions.index(current_question) + 1
    end
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    self.passed = true if self.success?
    save!
  end

  private
    def before_validation_set_first_question
      self.current_question = test.questions.first
    end

    def before_update_set_next_question
      self.current_question = next_question
    end

    def correct_answer?(answer_ids)
      answer_ids ||= []
      correct_answers.ids.sort == answer_ids.map(&:to_i).sort
    end

    def correct_answers
      current_question.answers.correct
    end

    def next_question
      test.questions.order(:id).where("id > ?", current_question.id).first
    end
end
