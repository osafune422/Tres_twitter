class LikesController < ApplicationController
    def like
        @like = Like.new(
            userlike_id: @current_user.id,
            tweet_id: params[:tweet_id]
            )
        @like.save
        redirect_to("/show/#{params[:tweet_id]}")
    end
    
    def destroy
        @like = Like.find_by(
            userlike_id: @current_user.id,
            tweet_id: params[:tweet_id]
            )
        @like.destroy
        redirect_to("/show/#{params[:tweet_id]}")
    end
end
