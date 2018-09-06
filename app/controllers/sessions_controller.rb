class SessionsController < ApplicationController

  def login 
    @user = User.find_by(:name = params[:name])
    if @user 
      session[:user_id] = @user.id 
      redirect_to notes_path 
    else 
      redirect_to login_path 
    end 
  end

  def logout 
    if session[:user_id].present? 
      session.delete :user_id
    else 
      redirect_to login_path
    end
  end

end 
