class Event < ApplicationRecord
  has_many :registrations
  has_many :members, through: :registrations
end
