require 'spec_helper'

describe "LayoutLinks" do

  it "should have Home page at '/' link" do
    get '/'
    # response.status.should be(200)
    response.should have_selector('title', :content => "Home")
  end

  it "should have Contacts page at '/Contacts' " do
    get '/contacts'
    response.should have_selector('title', :content => "Contacts")
  end

  it "should have Help page at '/Help' " do
    get '/help'
    response.should have_selector('title', :content => "Help")
  end

  it "should have About page at '/About' " do
    get '/about'
    response.should have_selector('title', :content => "About")
  end

end