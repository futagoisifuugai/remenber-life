class TweetsController < ApplicationController
  def index
    @tweets = Tweet.includes(:user).order("created_at DESC").page(params[:page]).per(3)
  end
  def new
    @tweet = Tweet.new
  end
  def create
    Tweet.create(tweet_params)
  end

  private
  def tweet_params
    params.require(:tweet).permit(:title, :text).merge(user_id: current_user.id)
  end

end
