class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :department
  has_many :products
end
