class FeedbackMailer < ApplicationMailer

  def feedback_email(email, message)
    @email = email
    @message = message
    mail to: 'ror.mailer.1@gmail.com', subject: 'New feedback on Test Guru'
  end
end
