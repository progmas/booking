class Event < ApplicationRecord
  belongs_to :user
  has_many :tickets, dependent: :destroy

  validates :name, presence: true, length: { maximum: 100 }
  validates :description, presence: true, length: { maximum: 500 }
  validates :location, presence: true
  validates :date, presence: true
  validates :total_tickets, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :upcoming, -> { where('date >= ?', Time.current).order(date: :asc) }
  scope :past, -> { where('date < ?', Time.current).order(date: :desc)  }

  before_validation :set_default_total_tickets, on: :create

  # The lock_version column is used for optimistic locking
  lock_optimistically

  def tickets_sold
    tickets.sum(:quantity)
  end

  # Calculates the number of tickets remaining
  def tickets_available
    total_tickets - tickets.sum(:quantity)
  end

  # Caches the number of remaining tickets
  def cached_tickets_available
    Rails.cache.fetch("#{cache_key}/tickets_available", expires_in: 5.minutes) do
      tickets_available
    end
  end

  # Checks if there are enough tickets
  def enough_tickets?(quantity)
    tickets_available >= quantity
  end

  private

  # Set default total_tickets to 0 if not provided
  def set_default_total_tickets
    self.total_tickets ||= 0
  end
end