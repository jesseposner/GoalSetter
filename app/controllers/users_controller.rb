class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_goals = @user.goals
    @public_goals = Goal.all.select { |goal| goal.private == false }
    render :show
  end

  def index
    @users = User.all
    render :index
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      log_in(@user)
      redirect_to users_url
    else
      flash.now[:errors] = @users.errors.full_messages
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
