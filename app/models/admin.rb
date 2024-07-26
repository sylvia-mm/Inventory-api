# class Admin < ApplicationRecord
#     has_secure_password
  
#     validates :first_name, :last_name, presence: true
#     validates :email, presence: true, format: { with: /\A[^@\s]+@dakawou\.com\z/, message: "Use a valid DTL email address" }, uniqueness: true
#     validates :password, presence: true, length: {minimum: 6 }
# end

class Admin < ApplicationRecord
  has_secure_password

  validates :first_name, :last_name, presence: true
  validates :email, presence: true, format: { with: /\A[^@\s]+@dakawou\.com\z/, message: "Use a valid DTL email address" }, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  validate :email_in_authorized_list

  AUTHORIZED_USERS = ['it@dakawou.com', 'washington@dakawou.com', 'itsupport@dakawou.com', 'sylvia.mumbi@dakawou.com']

  private

  def email_in_authorized_list
    unless AUTHORIZED_USERS.include?(email)
      errors.add(:email, 'is not authorized to sign up')
    end
  end
end
