class UsersController < ApplicationController

  def show
    @tweets = Tweet.where(user_id: current_user.id).order("id DESC")
  end
end
