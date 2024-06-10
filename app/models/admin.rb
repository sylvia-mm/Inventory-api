class Admin < ApplicationRecord
    has_secure_password
  
    validates :first_name, :last_name, presence: true
    validates :email, presence: true, format: { with: /\A[^@\s]+@dakawou\.com\z/, message: "Use a valid DTL email address" }, uniqueness: true
    validates :password, presence: true, length: {minimum: 6 }
end