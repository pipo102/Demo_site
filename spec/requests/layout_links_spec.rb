require 'spec_helper'

describe "LayoutLinks" do

  it "should have Home page at '/' link" do
    visit '/'
    expect(page).to have_content('Home')
  end

  it "should have Contacts page at '/Contacts' " do
    visit '/contacts'
    expect(page).to have_content('Contacts')
  end

  it "should have Help page at '/Help' " do
    visit '/help'
    expect(page).to have_content('Help')
  end

  it "should have About page at '/About' " do
    visit '/about'
    expect(page).to have_content('About')
  end

  it "should have Sign up page at 'sign_up'" do
    visit '/sign_up'
    expect(page).to have_content('Sign up')
  end

  it "should have the right links on the layout" do
    visit root_path

    click_link "About"
    expect(page).to have_title(full_title('About'))

    click_link "Contacts"
    expect(page).to have_title(full_title('Contacts'))

    click_link "Places"
    expect(page).to have_title(full_title('Places'))

    click_link "Help"
    expect(page).to have_title(full_title('Help'))

    # click_link "Home"
    # expect(page).to have_tit
#it requires to visit 'Home' page first in order to pass
    click_link "Sign up now!"
    expect(page).to have_title(full_title('Sign up'))
  end

end