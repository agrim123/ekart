class SessionsController < ApplicationController

  def new
    @categories = Category.all
  end

  def create
    @categories = Category.all
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      if current_user.admin?
        redirect_back_or dashboard_url
      else
        redirect_back_or store_url
      end
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    @categories = Category.all
    log_out
    redirect_back_or store_url
  end
end
