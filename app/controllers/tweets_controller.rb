class TweetsController < ApplicationController

  before_action :tweet_set, only: [:destroy, :edit, :update]

  def index
    @tweets = Tweet.all.order("id DESC")
  end

  def new
    @tweets = Tweet.new
  end

  def create
    Tweet.create(tweet_params)
    redirect_to action: "index"
  end

  def destroy
    @tweet.destroy if @tweet.user_id == current_user.id
    redirect_to action: "index"
  end

  def edit
  end

  def update
    if @tweet.user_id == current_user.id
    @tweet.update(tweet_params)
    redirect_to action: "index"
    end
  end

  private
  def tweet_params
    params.require(:tweet).permit(:text).merge(user_id: current_user.id)
  end

  def tweet_set
    @tweet = Tweet.find(params[:id])
  end

end
