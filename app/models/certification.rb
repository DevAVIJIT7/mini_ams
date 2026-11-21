class Certification < ApplicationRecord
  belongs_to :member

  has_many :certification_activities,
           dependent: :destroy
end
