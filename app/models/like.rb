class Like < ApplicationRecord
    # userlike_idのエラー条件
    validates :userlike_id, {presence: true}
    # tweet_idのエラー条件
    validates :tweet_id, {presence: true}
    
end
