class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"

  has_many :event_attendances, foreign_key: 'attended_event_id', dependent: :destroy
  has_many :attendees, through: :event_attendances, dependent: :destroy

  has_many :event_invites, foreign_key: 'invited_event_id', dependent: :destroy
  has_many :invitees, through: :event_invites, dependent: :destroy

  validates :title, presence: true
  validates :date, presence: true

  scope :past, -> { where('date < :today', today: Date.today) }
  scope :upcoming, -> { where('date >= :today', today: Date.today) }
end
