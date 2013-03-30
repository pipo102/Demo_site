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

require 'spec_helper'

describe RUser do

  before { 
    @atr = RUser.new(name:"Nety", email:"hkoland@com.net")
  }

  subject(@atr)
  
  it {should be_valid}
  it {should respond_to(:name)}
  it {should respond_to(:email)}

  describe "when names are too long" do
    before {@atr.name = "a" * 22}
    it {should_not be_valid}
  end 

  describe "should have minimum long mail" do
    before {@atr.email="3@w.c"}
    it {should_not be_valid} 
  end

  describe "should have maximum long mail" do
    before {@atr.email= "@" * 36} 
    it {should_not be_valid}
  end

  describe "should have valid email" do
    it "should be valid" do
      addresses = %w[mirk.hrcak@net.com MALI_123@mirk.nit.com mirko@foo.bar]
      addresses.each do |adres|
        @atr.email = adres
        expect(@atr).to be_valid
      end
    end
  end

  describe "shoudl reject invalid mail" do
    it "should not be valid" do
      addresses = %w[1233.com  .@.com ___DSFODF_@jh.]
      addresses.each do |adres|
        @atr.email = adres
        expect(@atr).not_to be_valid
      end
    end
  end

  describe "should have unique email" do
    before do
      astar = @atr.dup
      astar.save
    end
    it {should_not be_valid}
  end

end
