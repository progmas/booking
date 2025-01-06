class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :available_tickets

  # Callback: Update event's remaining tickets after a ticket is booked
  after_create :update_event_tickets

  private

  # Custom validation: Check if there are enough tickets available in the event
  def available_tickets
    if event.total_tickets < quantity
      errors.add(:quantity, "Not enough tickets available. Only #{event.total_tickets} tickets left.")
    end
  end

  # Update the event's remaining tickets after a ticket is booked
  def update_event_tickets
    event.update(total_tickets: event.total_tickets - quantity)
  end
end