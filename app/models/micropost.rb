# == Schema Information
#
# Table name: microposts
#
#  id         :integer          not null, primary key
#  content    :string(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Micropost < ActiveRecord::Base
  attr_accessible :content, :r_user_id

  belongs_to :r_user
  
  validates :content, presence: true,
                      length: { :maximum => 30}
  validates :r_user_id, presence: true
end
