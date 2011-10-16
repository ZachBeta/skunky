class Upvote < ActiveRecord::Base
  has_one :user
  belongs_to :pitch
end
# == Schema Information
#
# Table name: upvotes
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  pitch_id   :integer
#  comment    :text
#  created_at :datetime
#  updated_at :datetime
#

