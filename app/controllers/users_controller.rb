class UsersController < ApplicationController


  def show
    @name = current_user.name
    @tweetss = current_user.tweets
    @tweets = Tweet.includes(:user).order("created_at DESC").page(params[:page]).per(3)
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
