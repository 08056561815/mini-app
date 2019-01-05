class TweetsController < ApplicationController

  def index
    @tweets = Tweet.all.order("id DESC")
  end

  def new
    @tweets = Tweet.new
  end

  def create
    Tweet.create(text: tweet_params[:text], user_id: current_user.id)
    redirect_to action: "index"
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy if tweet.user_id == current_user.id
    redirect_to action: "index"
  end

  def edit
    @tweets = Tweet.find(params[:id])
  end

  def update
    tweet = Tweet.find(params[:id])
    if tweet.user_id == current_user.id
    tweet.update(tweet_params)
    redirect_to action: "index"
    end
  end

  private
  def tweet_params
    params.require(:tweet).permit(:text)
  end

end
