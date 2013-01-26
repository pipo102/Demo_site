class PageController < ApplicationController
  def home
    @title = "Home"
  end

  def contacts
    @title = "Contacts"
  end

  def about
    @title = "About"
  end
end
