# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :find_question, only: %i[create show destroy]
  before_action :find_test, only: %i[index new create show]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render json: @test.questions
  end

  def show
    render json: show_question
  end

  def create
    @tests.questions.new(question_params)
    render plain: @question.inspect
  end

  def destroy
    @question.destroy
    redirect_to test_questions_path(@question.tests)
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def show_question
    @test.questions.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def rescue_with_question_not_found
    render plain: "Question not found"
  end
end
