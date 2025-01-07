require "test_helper"

class TicketTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
    @event = events(:one)
    @ticket = Ticket.new(event: @event, user: @user, quantity: 1)
  end

  test "should be valid" do
    assert @ticket.valid?
  end

  test "quantity should be positive" do
    @ticket.quantity = 0
    assert_not @ticket.valid?
  end

  test "should belong to an event" do
    assert_equal @event, @ticket.event
  end

  test "should belong to a user" do
    assert_equal @user, @ticket.user
  end
end
