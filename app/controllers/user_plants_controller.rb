class UserPlantsController < ApplicationController
  def create
    GardenService.create_user_plant(params[:user_id], params[:plant_id])
    redirect_to dashboard_path, flash: { success: 'Plant added to your garden!' }
  end
end
