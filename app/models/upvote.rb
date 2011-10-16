class Upvote < ActiveRecord::Base
  has_one :user
  belongs_to :pitch
end
