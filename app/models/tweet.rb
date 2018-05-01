class Tweet < ApplicationRecord
    # contentのエラー条件
    validates :content, {presence: true, length: {maximum: 140}}
    #user_idのエラー条件
    validates :user_id, {presence: true}
    
    def user
        return User.find_by(id: self.user_id)
    end
end
