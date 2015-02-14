class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_subdomain

  def current_subdomain
    @subdomain ||= request.subdomain
  end
end
