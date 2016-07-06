require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  setup do
    @event = events(:one)
  end

  test "should get index" do
    get :index, org_id: 1
    assert_response :success
    assert_not_nil assigns(:events)
  end

  test "should post event" do
    xhr :post, "orgs/1/events/string=helloword"
    assert_response :success
  end
end
