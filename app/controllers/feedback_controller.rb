class FeedbackController < ApplicationController
  skip_before_action :authenticate_user!

  def new

  end

  def create
    if params[:email].present? && params[:message].present?
      FeedbackMailer.feedback_email(params[:email], params[:message]).deliver_now
      flash[:success] = t('.success')
    else
      flash[:danger] = t('.danger')
    end

    redirect_to root_path
  end
end
