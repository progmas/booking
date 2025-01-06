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
  end

  def create
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
end
