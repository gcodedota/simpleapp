class SessionsController < ApplicationController

  def create
    user = Employee.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      log_in user
      redirect_back_or user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to '/'
  end
end
