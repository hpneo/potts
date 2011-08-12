class UsersController < ApplicationController

  def show
    @categories = User.find(params[:id]).categories
  end

end