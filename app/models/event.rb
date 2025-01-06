class Event < ApplicationRecord
  belongs_to :user
  has_many :tickets, dependent: :destroy

  validates :name, presence: true, length: { maximum: 100 }
  validates :description, presence: true, length: { maximum: 500 }
  validates :location, presence: true
  validates :date, presence: true
  validates :total_tickets, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :upcoming, -> { where('date >= ?', Time.current) }
  scope :past, -> { where('date < ?', Time.current) }

  before_validation :set_default_total_tickets, on: :create

  def tickets_sold
    tickets.sum(:quantity)
  end

  def tickets_available
    total_tickets - tickets_sold
  end

  private

  # Set default total_tickets to 0 if not provided
  def set_default_total_tickets
    self.total_tickets ||= 0
  end
end