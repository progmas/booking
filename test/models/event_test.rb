require "test_helper"

class EventTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
    @event = Event.new(name: "Test Event", description: "Test Description", location: "Test Location", date: Time.now, total_tickets: 10, user: @user)
  end

  test "should be valid" do
    assert @event.valid?
  end

  test "name should be present" do
    @event.name = "   "
    assert_not @event.valid?
  end

  test "total_tickets should be non-negative" do
    @event.total_tickets = -1
    assert_not @event.valid?
  end

  test "should belong to a user" do
    assert_equal @user, @event.user
  end
end
