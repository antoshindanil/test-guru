class FeedbackMailer < ApplicationMailer
  def send_feedback(user, message)
    @user = user
    @message = message
    mail to: Admin.pluck(:email)
  end
end
