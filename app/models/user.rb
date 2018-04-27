class User < ApplicationRecord
    # nameのエラー条件
    validates :name, {presence: true}
    # login_idのエラー条件
    validates :login_id, {presence: true, uniqueness: true}
    # passwordのエラー条件
    validates :password, {presence: true}
end
