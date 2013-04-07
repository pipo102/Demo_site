class RUsersController < ApplicationController
  def new
  end

  def show    
    @ruser = RUser.find(params[:id])
  end
end
