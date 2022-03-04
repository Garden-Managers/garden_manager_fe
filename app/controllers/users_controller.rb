class UsersController < ApplicationController
  before_action :require_user, only: %i[show update]
  def show
    if current_user.zip
      @forecast = GardenFacade.forecast(current_user.user_id)
      @fall, @spring = GardenFacade.frost_dates(current_user.user_id)
      @plants = GardenFacade.plants(current_user.user_id)
    else
      @plants = GardenFacade.plants(current_user.user_id)
    end
  end

  def update
    2.times do
      GardenFacade.update_user(current_user.user_id, params[:zip])
    end
    user = GardenFacade.find_user(current_user.user_id)
    session[:user_id] = nil
    session[:user_id] = user.user_id
    redirect_to dashboard_path,
                flash: {
                  success: 'Success! You can now see your local weather and planting data.'
                }
  end
end
