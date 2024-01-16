require "test_helper"

class DogBreedsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get dog_breeds_new_url
    assert_response :success
  end

  test "should get create" do
    get dog_breeds_create_url
    assert_response :success
  end
end
