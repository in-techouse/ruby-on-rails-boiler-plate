class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true, if: -> { request.format.json? }
  before_action :include_devise_auth_token, if: -> { request.format.json? }

  def include_devise_auth_token
    return DeviseTokenAuth::Concerns::SetUserByToken
  end

end

