class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  def logged_in_user

    logger.info "==============user #{logged_in?}"
    return unless logged_in?

    store_location
    flash[:danger] = 'Please log in.'
    redirect_to login_url
  end

  def admin_user_logged_in
    logger.info "==============admin #{logged_in? && admin?}"
    return unless logged_in? && admin?

    store_location
    flash[:danger] = 'Please log in as admin.'
    redirect_to login_url
  end

  def system_user_logged_in
    logger.info "==============system #{logged_in? && system?}"
    return unless logged_in? && system?

    store_location
    flash[:danger] = 'Please log in as system.'
    redirect_to login_url
  end

  def current_user
    super
  end
end
