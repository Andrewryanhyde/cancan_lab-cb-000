class UsersController < ApplicationController

  def create 
    @user = User.new(:name => params[:name])
    if @user.save 
      redirect_to notes_path
    else 
      redirect_to root_path 
    end 
  end 



end 
