class GoalsController < ApplicationController
  def show
    @goal = Goal.find(params[:id])
    render :show
  end

  def new
    @goal = Goal.new
    render :new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user_id = current_user.id
    if @goal.save
      redirect_to user_url(current_user)
    else

      flash.now[:errors] = @goal.errors.full_messages
      render :new
    end
  end

  private
  def goal_params
    params.require(:goal).permit(:title, :description, :private)
  end
end
