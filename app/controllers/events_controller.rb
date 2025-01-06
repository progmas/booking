class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
  end

  def show
    @event = Event.find(params[:id])
    @ticket = Ticket.new # Bilet oluşturma formu için boş bir Ticket nesnesi
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
end
