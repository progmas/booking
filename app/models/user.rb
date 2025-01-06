class User < ApplicationRecord
  # Include default Devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events, dependent: :destroy
  has_many :tickets, dependent: :destroy
  has_many :booked_events, through: :tickets, source: :event

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :encrypted_password, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end

  def created_events
    events
  end

  # Returns all events the user has booked tickets for
  def attended_events
    booked_events.distinct
  end
end