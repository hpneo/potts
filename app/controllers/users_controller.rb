class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    if params[:date]
      @categories = Task.where("created_at >= :date OR created_at <= :date", { :date => params[:date] }).map{|i| i.category }.uniq
    else
      @categories = @user.categories
    end
  end

end