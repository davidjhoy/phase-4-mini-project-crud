class SpicesController < ApplicationController

rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

wrap_parameters format: []

def render_not_found
    render json: {error: "not found"}, status: :not_found
end

def index
    render json: Spice.all 
end

def create 
    new_plant = Spice.create(plant_params)
    render json: new_plant, status: :created
end

def update
    update_plant = find_plant
    update_plant.update(plant_params)
    render json: update_plant
end

def destroy
    find_plant.destroy
    head :no_content
end

private 
def plant_params
    params.permit(:title, :image, :description, :notes, :rating)

end

def find_plant
    Spice.find(params[:id])
end


end

