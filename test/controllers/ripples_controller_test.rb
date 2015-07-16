require 'test_helper'

class RipplesControllerTest < ActionController::TestCase
  
self.use_transactional_fixtures = true

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ripples)
  end

  test "should get newest" do
	session[:page] = 2
	get :newest
	assert_redirect_to ripples_url
end

  end
