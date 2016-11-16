require 'test_helper'

class ClienteControllerTest < ActionController::TestCase
  test "should get agenda_citas" do
    get :agenda_citas
    assert_response :success
  end

end
