class ProductSerializer < ActiveModel::Serializer
  attributes :id, :serial_number, :category, :name, :date_bought, :unit_price, :status, :user_id
  # has_one :user
end
