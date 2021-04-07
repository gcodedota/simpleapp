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

  def activate
    user = Employee.find(params[:id])
    if (Time.at(params[:sent_time].to_i) - Time.now) < 15.minutes && !user.nil?
      user.status = 'activated'
      user.save!
      redirect_to user
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
