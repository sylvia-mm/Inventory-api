class User < ApplicationRecord
    has_many :products, dependent: :nullify

    CATEGORIES = ['Stores', 'IT', 'Maintenance', 'Operations', 'Drivers', 'Finance', 'HSSE', 'HR']
    validates :department, presence: true, inclusion: { in: CATEGORIES, message: "Please use a valid category" }
    validates :first_name, :last_name, presence: true
    validates :email, presence: true, format: { with: /\A[^@\s]+@dakawou\.com\z/, message: "Use a valid DTL email address" }, uniqueness: true
end
