require 'spec_helper'

describe PageController do
render_views
before(:each) do
  @main_title = "RoR SAPP |"
end

  describe "GET 'home'" do
    it "returns http success" do
      get 'home'
      response.should be_success
    end

    it "should have appropriate title" do
      get 'home'
      response.should have_selector("title", :content => @main_title + " Home") 
    end
  end

  describe "GET 'contacts'" do
    it "returns http success" do
      get 'contacts'
      response.should be_success
    end

    it "should have appropriate title" do
      get 'contacts'
      response.should have_selector("title", :content => @main_title + " Contact") 
    end
  end

  describe "GET 'help'" do
    it "return http success" do
      get 'help'
      response.should be_success
    end

    it "should have appropriate title" do
      get 'help'
      response.should have_selector("title", :content => @main_title + " Help")
    end
  end

  describe "GET 'about'" do
    it "returns http success" do
      get 'about'
      response.should be_success
    end

    it "should have appropriate title" do
      get 'about'
      response.should have_selector("title", :content => @main_title + " About") 
    end
  end

end
