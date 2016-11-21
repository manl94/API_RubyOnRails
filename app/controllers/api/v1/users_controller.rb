class Api::V1::UsersController < ApplicationController
  #POST /Users
  def create
    #params = {auth: {provider: 'facebook', uid:'uida12dda7'}}

    if params[:auth]
      @user = User.from_omniauth(params[:auth])

      @token = @user.tokens.create()#Token.create(user: @user)

      render "api/v1/users/show"
    else
      render json: {error: "Auth param is missing"}
    end


  end

end
