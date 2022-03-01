class UsersController < ApplicationController
  def show
    if current_user.zip
      @forecast = GardenFacade.new.forecast(current_user.user_id)
      @fall, @spring = GardenFacade.new.frost_dates(current_user.user_id)
      @plants = GardenFacade.new.plants(current_user.user_id)
    else
      @plants = GardenFacade.new.plants(current_user.user_id)
    end 
  end
end
