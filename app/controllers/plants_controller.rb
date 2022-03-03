class PlantsController < ApplicationController
  def index
    @plants = GardenFacade.all_plants
  end

  def create
    plant = GardenFacade.add_plant(plant_params)
    if plant
      GardenService.create_user_plant(current_user.user_id, plant.id)
      redirect_to plants_path, flash: { success: "#{plant.name} successfully added!" }
    else
      flash[:failed] = plant[:errors]
    end
  end

  private

  def plant_params
    params.permit(:name, :frost_date, :maturity)
  end
end
