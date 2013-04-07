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

  before do 
    @atr = RUser.new(name:"Mali", email:"nitkov@gdj.com",
                      password:"foobar", password_confirmation:"foobar")
  end

  subject(@atr)
  
    it {expect(@atr).to be_valid}
    it {expect(@atr).to respond_to(:name)}
    it {expect(@atr).to respond_to(:email)}
    it {expect(@atr).to respond_to(:password_digest)}
    it {expect(@atr).to respond_to(:password)}
    it {expect(@atr).to respond_to(:password_confirmation)}
    it {expect(@atr).to respond_to(:authenticate)}

  describe "when names are too long" do
    before {@atr.name = "a" * 22}
    it {expect(@atr).not_to be_valid}
  end 

  describe "should have minimum long mail" do
    before {@atr.email="3@w.c"}
    it {expect(@atr).not_to be_valid} 
  end

  describe "should have maximum long mail" do
    before {@atr.email= "@" * 36} 
    it {expect(@atr).not_to be_valid}
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

  describe "should reject invalid mail" do
    it "should not be valid" do
      addresses = %w[1233.com  .@.com ___DSFODF_@jh. test@mik..com]
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
    it {expect(@atr).not_to be_valid}
  end

  describe "should reject empty password" do
    before {@atr.password = @atr.password_confirmation = " "}
    it {expect(@atr).not_to be_valid}
  end

  describe "should reject mismatched password" do
    before {@atr.password_confirmation = "mismatch"}
    it {expect(@atr).not_to be_valid}
  end

  describe "password_confirmation should not be nil" do
    before {@atr.password_confirmation = nil}
    it {expect(@atr).not_to be_valid}
  end

  describe "should not have short password" do
    before {@atr.password = @atr.password_confirmation = "a" * 5}
    it {expect(@atr).not_to be_valid }
  end

  describe "return value of authenticate method" do
    before{ @atr.save }
    let(:found_usr) {RUser.find_by_email(@atr.email)}

    describe "with valid password" do
      it { expect(@atr).to eql(found_usr.authenticate(@atr.password))}
    end

    describe "with invalid password" do
      let(:invalid_pass) {found_usr.authenticate("invalid")}

      it { expect(@atr).not_to eql(invalid_pass) }
      specify { expect(invalid_pass).to be_false }
    end
  end
end
