class Admin::AnswersController < Admin::BaseController

  before_action :find_question, only: %i[new create]
  before_action :find_answer, only: %i[show edit update destroy]

  def show

  end

  def new
    @answer = @question.answers.new
  end

  def edit

  end

  def create
    @answer = @question.answers.new(answer_params)

    if @answer.save
      flash[:success] = 'Answer successfully created!'
      redirect_to admin_question_path(@question)
    else
      render :new
    end
  end

  def update
    if @answer.update(answer_params)
      flash[:success] = 'Answer successfully edited!'
      redirect_to admin_answer_path(@answer)
    else
      render :edit
    end
  end

  def destroy
    @answer.destroy
    flash[:success] = 'Answer successfully deleted!'
    redirect_to admin_question_path(@answer.question)
  end

  private

    def find_answer
      @answer = Answer.find(params[:id])
    end

    def answer_params
      params.require(:answer).permit(:body, :correct)
    end

    def find_question
      @question = Question.find(params[:question_id])
    end
end
