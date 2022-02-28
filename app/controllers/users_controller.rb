class UsersController < ApplicationController
  def create
    auth_hash = request.env['omniauth.auth'] #getting all info from google
    email = auth_hash['info']['email'] #grabbing email
    name = auth_hash['info']['name'] #grabbing name

    #user = GardenFacade.find_user_by_email(email)
    #if user
    # session[:user_id] = user.id
    #session[:access_token] = auth_hash['credentials']['token']
    #  redirect_to "/dashboard"
    #else
    # GardenFacade.create_user(email, name)
    #session[:access_token] = auth_hash['credentials']['token']
    #  redirect_to "/dashboard"
    
    #consume from backend
    #@user = UserFacade
  end
end 