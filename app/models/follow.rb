class Follow < ApplicationRecord
    acts_in_relation :action, source: :user, target: :user
end
