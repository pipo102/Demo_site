# == Schema Information
#
# Table name: r_users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class RUser < ActiveRecord::Base
  attr_accessible :email, :name

  has_many :microposts

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name,  presence: true,
                    length: { maximum: 21 }
  validates :email, presence: true,
                    length: { minimum: 6, maximum: 35},
                    format: { with: email_regex},
                    uniqueness: { case_sensitive: false}
end
