class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @events = Event.upcoming
  end


  def show
    @event = Event.find(params[:id])
    @ticket = Ticket.new
  end

  def new
    @event = current_user.events.new
  end

  def create
    @event = current_user.events.new(event_params)

    if @event.save
      redirect_to @event, notice: 'Event was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def past
    @events = Event.past
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :location, :date, :total_tickets)
  end
end
