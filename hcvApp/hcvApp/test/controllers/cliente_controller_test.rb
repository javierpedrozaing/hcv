require 'test_helper'

class ClienteControllerTest < ActionController::TestCase
  test "should get agendacitas" do
    get :agendacitas
    assert_response :success
  end

end
