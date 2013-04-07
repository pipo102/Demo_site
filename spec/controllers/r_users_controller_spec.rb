require 'spec_helper'

describe RUsersController do
render_views

  describe "GET 'new'" do

    it "should have right title" do
      get 'new'
      expect(page).to have_title(full_title('Sign up'))
    end
  end

end
