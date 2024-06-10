class User < ApplicationRecord
    has_many :products

    CATEGORIES= ['Stores', 'IT', 'Maintenance', 'Operations', 'Drivers', 'Finance']
    validates :department, presence: true, inclusion: { in: CATEGORIES, message: "Please use a valid category" }
    validates :first_name, :last_name, presence: true
    validates :email, presence: true, format: { with: /\A[^@\s]+@dakawou\.com\z/, message: "Use a valid DTL email address" }, uniqueness: true
end
