class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @categories = @user.categories
  end

end