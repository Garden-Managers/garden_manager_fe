class SessionsController < ApplicationController
  def create
    facade = GardenFacade.new
    auth_hash = request.env['omniauth.auth'] #getting all info from google
    email = auth_hash['info']['email'] #grabbing email
    name = auth_hash['info']['name'] #grabbing name
    user = facade.find_user_by_email(email)
    if user
      session[:user_id] = user.user_id
      session[:access_token] = auth_hash['credentials']['token']
      redirect_to "/dashboard", notice: "Welcome #{user.name}!"
    else
      user = facade.create_user(email, name)
      session[:user_id] = user.user_id
      session[:access_token] = auth_hash['credentials']['token']
      redirect_to "/dashboard", notice: "Welcome #{user.name}!"
    end
  end
end