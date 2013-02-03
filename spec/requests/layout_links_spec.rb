require 'spec_helper'

describe "LayoutLinks" do

  it "should have Home page at '/' link" do
    get '/'
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

  it "should have Sign up page at 'sign_up'" do
    get '/sign_up'
    response.should have_selector("title", :content => "Sign up")
  end

  it "should have the right links on the layout" do
    visit root_path

    click_link "About"
    response.should have_selector('title', :content => "About")

    click_link "Contacts"
    response.should have_selector('title', :content => "Contacts")

    click_link "Places"
    response.should have_selector('title', :content => "Places")

    click_link "Help"
    response.should have_selector('title', :content => "Help")

    click_link "Home"
    response.should have_selector('title', :content => "Home")

    click_link "Sign up now!"
    response.should have_selector('title', :content => "Sign up")
  end

end