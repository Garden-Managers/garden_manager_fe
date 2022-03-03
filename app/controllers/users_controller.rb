class UsersController < ApplicationController

  def show
    if current_user.zip
      @forecast = GardenFacade.forecast(current_user.user_id)
      @fall, @spring = GardenFacade.frost_dates(current_user.user_id)
      @plants = GardenFacade.plants(current_user.user_id)
    else
      @plants = GardenFacade.plants(current_user.user_id)
    end
  end
end
