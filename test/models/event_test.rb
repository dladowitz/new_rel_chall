require 'test_helper'

class EventTest < ActiveSupport::TestCase
  test "create a new event" do
    event = Event.new(org_id: 1, string: "Hello World")
    assert_equal(event.string, "Hello World")
  end
end
