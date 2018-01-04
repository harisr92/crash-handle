class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, :set_cookie

  def set_cookie
    return if request.path.include?('users')
    cookies[:path] = {
      value: request.path,
      expires: 1.year.from_now
    }
  end

  def after_sign_in_path_for(_resource)
    cookies[:path]
  end

  def after_sign_out_path_for(_resource)
    cookies[:path] = {
      value: '/',
      expires: 1.year.from_now
    }
    '/users/sign_in'
  end
end
