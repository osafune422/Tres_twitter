class User < ApplicationRecord
    # nameのエラー条件
    validates :name, {presence: true}
    # login_idのエラー条件
    validates :login_id, {presence: true, uniqueness: true}
    # passwordのエラー条件
    validates :password, {presence: true}
    
    has_secure_password
    
    def tweets
        @tweet=Tweet.where(user_id: self.id)
        return @tweet.all.order("created_at DESC")
    end
end
