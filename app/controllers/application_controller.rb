class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  before_filter do
    resource = controller_name.singularize.to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end

  def current_user
    if session[:user_id]
      @current_user ||= Employee.find_by(id: session[:user_id])
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to '/', alert: exception.message
  end
end
