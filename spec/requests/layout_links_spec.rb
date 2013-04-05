require 'spec_helper'

describe "LayoutLinks" do

  it "should have Home page at '/' link" do
    visit '/'
    expect(page).to have_content('Home')
  end

  it "should have Contacts page at '/Contacts' " do
    visit '/contacts'
    expect(page).to have_title('Contacts')
  end

  it "should have Help page at '/Help' " do
    visit '/help'
    expect(page).to have_title('Help')
  end

  it "should have About page at '/About' " do
    visit '/about'
    expect(page).to have_title('About')
  end

  it "should have Sign up page at 'sign_up'" do
    visit '/sign_up'
    expect(page).to have_title('Sign_up')
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
#it requires to visit 'Home' page first in order to pass
    click_link "Sign up now!"
    response.should have_selector('title', :content => "Sign up")
  end

end