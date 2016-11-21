class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  before_action :authenticate

  def authenticate
    token_str = params[:token]
    token = Token.find_by(token: token_str)

    if token.nil? || !token.is_valid?
      render json: {error: "Tu token es invalido", status: :unauthorized}
    end
    else
      @current_user = token.user
    end
  end
end
