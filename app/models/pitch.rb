class Pitch < ActiveRecord::Base
  has_many :upvotes
  belongs_to :user
end
