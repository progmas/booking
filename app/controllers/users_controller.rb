class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @created_events = @user.events
    @booked_tickets = @user.tickets.includes(:event)
  end
end
