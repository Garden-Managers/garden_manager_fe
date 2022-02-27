class UsersController < ApplicationController
  def create
    auth_hash = request.env['omniauth.auth']
    email = auth_hash['info']['email']
binding.pry
    user = User.find_or_create_by(email: email)

    session[:access_token] = auth_hash['credentials']['token']
    redirect_to '/'
    #consume from backend
    #@user = UserFacade
  end
end 