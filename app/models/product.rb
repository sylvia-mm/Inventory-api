class Product < ApplicationRecord

  # belongs_to :user, optional: true
  validates :serial_number, presence: true, uniqueness: true
  validates :category, :name, :date_bought, presence: true
  validates :unit_price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :status, presence: true, inclusion: { in: ['Available', 'Assigned'] }
  # validates :user_id, optional: true
end
