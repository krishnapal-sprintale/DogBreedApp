require 'faraday'
require 'json'

class DogBreed
  @base_url = "https://dog.ceo"
  def self.fetch_image(breed)
    response = Faraday.get("#{@base_url}/api/breed/#{breed.downcase}/images/random")
    data = JSON.parse(response.body)
  end
end
