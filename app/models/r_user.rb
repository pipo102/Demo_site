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
  attr_accessible :email, :name, :password, :password_confirmation

  has_many :microposts

  has_secure_password

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  validates :password, length: { minimum: 6}

  validates :password_confirmation, presence: true

  validates :name,  presence: true,
                    length: { maximum: 21 }
  validates :email, presence: true,
                    length: { minimum: 6, maximum: 35},
                    format: { with: EMAIL_REGEX},
                    uniqueness: { case_sensitive: false}
end
