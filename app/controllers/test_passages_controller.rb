# frozen_string_literal: true

class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show result update gist]

  def show
  end

  def result
  end

  def gist
    gist_service = GistQuestionService.new(@test_passage.current_question)
    result = gist_service.call

    flash_options = if gist_service.success?
      current_user.gists.create(question: @test_passage.current_question, github_id: result.id)
      { notice: t(".success", url: result[:html_url]) }
    else
      { notice: t(".alert") }
    end

    redirect_to @test_passage, flash_options
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed? && @test_passage.timeout?
      UserBadgeService.new(@test_passage).call if @test_passage.success?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    elsif !@test_passage.timeout?
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private
    def set_test_passage
      @test_passage = TestPassage.find(params[:id])
    end
end
