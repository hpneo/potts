class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    if params[:date]
      @categories = Task.where("DATE(created_at) = '#{params[:date]}'").map{|i| i.category }.uniq
    else
      @categories = @user.categories
    end
  end

end