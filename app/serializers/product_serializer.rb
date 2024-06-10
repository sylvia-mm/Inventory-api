class ProductSerializer < ActiveModel::Serializer
  attributes :id, :serial_number, :category, :name, :date_bought, :unit_price, :status
  has_one :user
end
