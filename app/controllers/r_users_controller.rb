class RUsersController < ApplicationController
  def new
    @title = "Sign up"
  end

  def show
    @title ="RUsers"

    @ruser = RUser.find(params[:id])
  end
end
