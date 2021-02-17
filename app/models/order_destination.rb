class OrderDestination
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :building_number, :phone_number, :order_id, :user_id, :item_id

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {only_integer: true }
    validates :city
    validates :address
    validates :phone_number, format: {with: /\A\d{11}\z/}
    validates :order_id
    validates :user_id
    validates :item_id
  end

  def save
    order = Order.create(user_id: user_id, item: item_id)
    Destination.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building_number: building_number, phone_number: phone_number, order_id: order_id)
  end
end