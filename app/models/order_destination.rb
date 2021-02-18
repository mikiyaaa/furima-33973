class OrderDestination
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :order_id, :user_id, :item_id, :token

  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { only_integer: true }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{11}\z/ }
    # validates :order_id
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    # 購入情報を保存し、変数orderに代入
    order = Order.create(user_id: user_id, item_id: item_id)
    # 配送先を保存
    Destination.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address,
                       building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
