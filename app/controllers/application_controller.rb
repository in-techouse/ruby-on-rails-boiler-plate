class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true, if: -> { request.format.json? }
  before_action :include_devise_auth_token, if: -> { request.format.json? }

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  def after_sign_in_path_for(resource)
    root_path
  end

  def include_devise_auth_token
    return DeviseTokenAuth::Concerns::SetUserByToken
  end

end

