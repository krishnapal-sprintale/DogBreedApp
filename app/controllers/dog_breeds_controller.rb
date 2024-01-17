class DogBreedsController < ApplicationController

  def index; end

  def fetch_dog_info
    @dog_image = DogBreed.fetch_image(params[:name]) if params[:name].present?
    if @dog_image["status"] == "success"
      @dog_breed_name = params[:name]
      render json: { dog_breed_name: @dog_breed_name, dog_image: @dog_image["message"] }
    else
      render json: { error: @dog_image["message"] }, status: :unprocessable_entity
    end
  end
end
