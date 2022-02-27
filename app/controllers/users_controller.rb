class UsersController < ApplicationController
  def show
    @forecast = GardenFacade.new.forecast(current_user.user_id)
  end
end
