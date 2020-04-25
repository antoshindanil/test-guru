# frozen_string_literal: true

class FeedbackController < ApplicationController
  before_action :authenticate_user!

  def message
  end

  def send_message
    FeedbackMailer.send_feedback(current_user, params[:message]).deliver_now

    @feedback = current_user.feedbacks.new(feedback_params)

    if @feedback.save
      redirect_to tests_path, notice: t(".success")
    else
      render :send_message, notice: t(".error")
    end
  end
end

private

def feedback_params
  params.permit(:message)
end
