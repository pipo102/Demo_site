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

  validates(:name, presence: true)
end
