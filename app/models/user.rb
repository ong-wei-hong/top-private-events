class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events, foreign_key: 'creator_id', class_name: 'Event'

  has_many :event_attendances, foreign_key: 'attendee_id'
  has_many :attended_events, through: :event_attendances

  has_many :event_invites, foreign_key: 'invitee_id'
  has_many :invited_events, through: :event_invites

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
end
