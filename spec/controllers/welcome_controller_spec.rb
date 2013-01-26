require 'spec_helper'

describe WelcomeController do 
  render_views

  describe "GET 'welcome'" do
    it "return http sucess" do
      get 'index'
      response.should be_success
    end
  end

end 