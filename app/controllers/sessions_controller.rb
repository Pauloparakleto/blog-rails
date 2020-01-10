class SessionsController < ApplicationController
  def new;end

  def create
    user = User.find_by(params[:user_id])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to new_admin_post_path
    else
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to posts_path
  end
end