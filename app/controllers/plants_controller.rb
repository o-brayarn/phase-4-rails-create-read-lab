class PlantsController < ApplicationController
    wrap_parameters format: []
  #GET all plants
  def index
    render json: Plant.all
  end

  #GET plant by index
  def show
    plant = Plant.find_by(id: params[:id])
    if plant
      render json: plant, status: :ok
    else
      render json: { error: "Couldn't find plant" }, status: :not_found
    end
  end

  #POST a new plant
  def create
    plant = Plant.create(plant_params)
    render json: plant, status: :created
  end

  private

  def plant_params
    params.permit(:name, :image, :price)
  end
end
