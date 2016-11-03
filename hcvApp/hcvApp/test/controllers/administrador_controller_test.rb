require 'test_helper'

class AdministradorControllerTest < ActionController::TestCase
  test "should get medico" do
    get :medico
    assert_response :success
  end

end
