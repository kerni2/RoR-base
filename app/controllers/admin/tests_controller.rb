class Admin::TestsController < Admin::BaseController

  before_action :find_test, only: %i[edit show update destroy ]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_test_not_found

  def index
    @tests = Test.all
  end

  def show

  end

  def new
    @test = Test.new
  end

  def edit

  end

  def create
    @test = current_user.created_tests.new(test_params)

    if @test.save
      flash[:success] = 'Test successfully created!'
      redirect_to admin_tests_path
    else
      render :new
    end
  end

  def update

    if @test.update(test_params)
      flash[:success] = 'Test successfully updated!'
      redirect_to admin_tests_path
    else
      render :edit
    end
  end

  def destroy

    @test.destroy
    flash[:success] = 'Test successfully deleted!'
    redirect_to admin_tests_path
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def rescue_test_not_found
    render plain: "Test not found"
  end
end
