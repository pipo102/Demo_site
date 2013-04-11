require 'spec_helper'

describe PageController do
  # render_views
  subject {page}

  before(:each) do
    @main_title = "RoR SAPP |"
  end

  describe "GET 'home'" do
    it "returns http success" do
      get 'home'
      expect(response).to be_success
    end

    # it "should have appropriate title" do
    #   visit 'home'
    #   expect(page).to have_title("RoR SAPP | Home") 
    # end
  end

  describe "GET 'places'" do
    it "returns http success" do
      get 'places'
      expect(response).to be_success
    end

    # it "has appropriate title" do
    #   get 'places'
    #   response.should have_selector("title", :content => @main_title + " Places")
    # end

    # it "has screaming part in content" do
    #   get 'places'
    #   response.should have_selector("p", :content => "PLACES")
    # end
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
