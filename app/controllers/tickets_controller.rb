class TicketsController < ApplicationController
  before_action :authenticate_user!
  def new
    @event = Event.find(params[:event_id])
    @ticket = current_user.tickets.new(event: @event)
  end

  def create
    @event = Event.find(params[:event_id])
    quantity = params[:ticket][:quantity].to_i

    if @event.tickets_available >= quantity
      @ticket = current_user.tickets.new(event: @event, quantity: quantity)

      if @ticket.save
        redirect_to @event, notice: 'Tickets booked successfully!'
      else
        redirect_to @event, alert: 'Failed to book tickets.'
      end
    else
      redirect_to @event, alert: 'Not enough tickets available.'
    end
  end
end