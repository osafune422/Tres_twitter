class TweetsController < ApplicationController
  before_action :ensure_correct_user, {only:[:destroy_tweet]}      #ユーザーのidが異なる時
  
  def timeline
  end
  
  def show
    @tweet = Tweet.find_by(id: params[:id])
    @user = @tweet.user
    @likes_count = Like.where(tweet_id:@tweet.id).count
  end
  
  def new_tweet
    @tweet = Tweet.new
  end
  
  def tweet
    @tweet = Tweet.new(
      user_id: @current_user.id,
      content: params[:content],
      )
    
    if @tweet.save
      flash[:notice] = "ツイートしました"
      redirect_to("/mypage/#{@current_user.id}/#{@current_user.login_id}")
    else
      render("tweets/new_tweet")
    end
  end
  
  def destroy_tweet
    @tweet = Tweet.find_by(id: params[:id])
    @tweet.destroy
    flash[:notice] = "ツイートを削除しました"
    redirect_to("/mypage/#{@current_user.id}/#{@current_user.login_id}")
  end
  
  def ensure_correct_user
    @tweet = Tweet.find_by(id: params[:id])
    if @current_user.id != @tweet.user_id.to_i
      flash[:notice] = "権限がありません"
      redirect_to("/mypage/#{@current_user.id}/#{@current_user.login_id}")
    end
  end
end
