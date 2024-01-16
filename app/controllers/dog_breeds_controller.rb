class DogBreedsController < ApplicationController
  def index
  end

  def fetch_dog_info
    @dog_image = fetch_dog_image(params[:name])
    if @dog_image.present?
      @dog_breed_name = params[:name]
      render json: { dog_breed_name: @dog_breed_name, dog_image: @dog_image }
    else
      render json: { error: "Breed not present with the name #{params[:name]}" }, status: :unprocessable_entity
    end
  end

  private

  def fetch_dog_image(breed)
    response = Faraday.get("https://dog.ceo/api/breed/#{breed.downcase}/images/random")
    data = JSON.parse(response.body)
    data['message']
  end
end
