class UsersController < ApplicationController

  def index
    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
    user = User.find(params[:id])
    @tweet = user.tweets.page(params[:page]).per(3).order("created_at DESC")
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
