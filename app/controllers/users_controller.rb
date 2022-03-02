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

  def update
    GardenFacade.new.update_user(params[:zip])
    redirect_to dashboard_path,
                flash: {
                  success: 'Zip has been added you can now get your forecast and frost dates!'
                }
  end
end
