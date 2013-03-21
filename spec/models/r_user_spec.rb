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

  before (:each) do
    @atr = {
      name:"Mirko",
      email:"hrckoland@dot.net",
      password: "foobar",
      confirm_password: "foobar"
    }
  end

  it "should create user with given attributes" do
    RUser.create(@atr)
  end

  it "should require a name" do 
    no_name_ruser = RUser.new(@atr.merge(name:""))
    no_name_ruser.should_not be_valid
  end

  it "should require email" do
    no_mail_user = RUser.new(@atr.merge(email:""))
    no_mail_user.should_not be_valid
  end

  it "should reject names that are too long" do
    loname = "a" * 22
    to_loong_name = RUser.new(@atr.merge(name: loname))
    to_loong_name.should_not be_valid
  end

  it "should have minimum long mail" do
    examp = "x@s"
    short_mail = RUser.new(@atr.merge(email:examp))
    short_mail.should_not be_valid 
  end

  it "should have maximum long mail" do
    examp = "@" * 36 
    long_mail = RUser.new(@atr.merge(email:examp))
    long_mail.should_not be_valid 
  end

  it "should have valid email" do
    addresses = %w[mirk.hrcak@net.com MALI_123@mirk.nit.com mirko@foo.bar]
    addresses.each do |adres|
      valid_mail = RUser.new(@atr.merge(email:adres))
      valid_mail.should be_valid
    end
  end

  it "shoudl reject invalid mail" do
    addresses = %w[1233.com  .@.com ___DSFODF_@jh.]
    addresses.each do |adres|
      invalid_mail = RUser.new(@atr.merge(email:adres))
      invalid_mail.should_not be_valid
    end
  end

  it "should have unique email" do
    upcase_mail = @atr[:email].upcase
    RUser.create!(@atr)
    User_with_duplicated_mail = RUser.new(@atr.merge(email:upcase_mail))
    User_with_duplicated_mail.should_not be_valid
  end

  describe "password validations" do

    it "should require password" do
      no_pass = RUser.new(@atr.merge(password:"", confirm_password:""))
      no_pass.should_not be_valid
    end

    it "should require matching password confirmation" do
      invalid_confirm = RUser.new(@atr.merge(confirm_password:"invalid"))
      invalid_confirm.should_not be_valid
    end

    it "should reject short password" do
      pass = "a" * 5
      short_pass = RUser.new(@atr.merge(password: pass, confirm_password: pass))
      ahort_pass.should_not be_valid
    end

    it "should reject long password" do
      pass = "a" * 41
      long_pass = RUser.new(@atr.merge(password: pass, confirm_password: pass))
      long_pass.should_not be_valid
    end

  end
end
