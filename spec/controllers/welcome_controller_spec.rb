require 'spec_helper'

describe WelcomeController do 
  render_views

  describe "GET 'welcome'" do
    it "return http sucess" do
      get 'index'
      response.should be_success
    end

    it "should have standard title" do
      get 'index'

      response.should have_selector("title", :content => "Demo")
    end
  end

end 