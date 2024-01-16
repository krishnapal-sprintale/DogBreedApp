class DogBreedsController < ApplicationController
  def new
    @dog_breed = DogBreed.new
  end

  def create
    @dog_breed = DogBreed.new(dog_breed_params)
    if @dog_breed.save
      render json: { name: @dog_breed.name, image_url: fetch_dog_image(@dog_breed.name) }
    else
      render json: { error: @dog_breed.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def dog_breed_params
    params.require(:dog_breed).permit(:name)
  end

  def fetch_dog_image(breed)
    response = Faraday.get("https://dog.ceo/api/breed/#{breed.downcase}/images/random")
    data = JSON.parse(response.body)
    data['message']
  end
end
