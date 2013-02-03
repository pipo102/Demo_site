require 'spec_helper'

describe RUsersController do
render_views

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end

    it "should have right title" do
      get 'new'
      response.should have_selector("title", :content => "Sign up")
    end
  end

end
