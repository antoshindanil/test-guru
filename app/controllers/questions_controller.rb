# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :find_question, only: %i[show destroy]
  before_action :find_test, only: %i[index new create show]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render json: @test.questions
  end

  def show
    render json: @test.questions.find(params[:id])
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      render json: @test.questions
    else
      render plain: "Question not created"
    end
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


  def find_test
    @test = Test.find(params[:test_id])
  end

  def rescue_with_question_not_found
    render plain: "Question not found"
  end
end
