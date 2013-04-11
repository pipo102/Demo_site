require 'spec_helper'

describe "RUserPages" do

  subject { page }

  describe "GET /r_user_pages" do
    it "works!" do
      before { visit signup_path }
      expect(response.status).to be(200)
    end

    it {expect(page).to have_title(full_title('Sign up'))}
  end
end
