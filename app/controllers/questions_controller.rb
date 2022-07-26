class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create]
  before_action :find_question, only: %i[show destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions
  end

  def show
  end

  def new
  end

  def create
    question = @test.questions.new(question_params)
    if question.save
      render plain: question.inspect
    else
      render plain: 'Введеные данные некорректны'
    end
  end

  def destroy
    @question.destroy
    render plain: 'Вопрос удалён'
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render inline: 'Вопроса с ID: <%= params[:id] %> нет'
  end
end