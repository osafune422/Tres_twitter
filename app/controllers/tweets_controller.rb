class TweetsController < ApplicationController
  def timeline
  end
  
  def show
    @tweet = Tweet.find_by(id: params[:id])
    @user = @tweet.user
  end
end
