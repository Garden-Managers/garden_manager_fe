class PlantsController < ApplicationController
  before_action :require_user, only: %i[index show]
  def index
    @plants = if params[:search].present?
                GardenFacade.search_plants(params[:search])
              else

                GardenFacade.all_plants
              end
  end

  def show
    @plant = GardenFacade.plant(params[:id])
  end

  def create
    plant = GardenFacade.add_plant(plant_params)
    if plant
      binding.pry
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
