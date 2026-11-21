class CertificationActivity < ApplicationRecord
  belongs_to :certification
  belongs_to :credit_type

  validates :amount,
            numericality: { greater_than: 0 }
end
