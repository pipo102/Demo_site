require 'spec_helper'

describe PageController do
render_views

  describe "GET 'home'" do
    it "returns http success" do
      get 'home'
      response.should be_success
    end

    it "should have appropriate title" do
      get 'home'
      response.should have_selector("title", :content => "RoR SAPP | Home") 
    end
  end

  describe "GET 'contacts'" do
    it "returns http success" do
      get 'contacts'
      response.should be_success
    end

    it "should have appropriate title" do
      get 'contacts'
      response.should have_selector("title", :content => "RoR SAPP | Contact") 
    end
  end

  describe "GET 'about'" do
    it "returns http success" do
      get 'about'
      response.should be_success
    end

    it "should have appropriate title" do
      get 'about'
      response.should have_selector("title", :content => "RoR SAPP | About") 
    end
  end

end
