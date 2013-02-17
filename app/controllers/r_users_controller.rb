class RUsersController < ApplicationController
  def new
    @title = "Sign up"
  end

  def show
    @title ="RUsers"

    @ruser = RUser.first
    # @ruser = RUser.find(parms[:id])
  end
end
