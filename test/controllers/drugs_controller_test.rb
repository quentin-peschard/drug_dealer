require 'test_helper'

class DrugsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get drugs_index_url
    assert_response :success
  end

end
