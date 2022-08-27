class AnswersController < ApplicationController
  before_action :find_question, only: %i[ new create ]
  before_action :find_answer, only: %i[ show edit update destroy ]

  def show
  end


  private

    def find_question
      @question = Question.find(params[:question_id])
    end

    def find_answer
      @answer = Answer.find(params[:id])
    end

    def answer_params
      params.require(:answer).permit(:body, :correct)
    end
end
