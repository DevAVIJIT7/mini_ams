class Registration < ApplicationRecord
  belongs_to :member
  belongs_to :event

  enum :status, {
    registered: "registered",
    cancelled: "cancelled"
  }

  validates :status, presence: true
  validates :event_id, uniqueness: { scope: :member_id }
end
