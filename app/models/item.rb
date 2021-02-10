class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :item_name
    validates :description

    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :status_id
      validates :shipping_cost_id
      validates :prefecture_id
      validates :shipping_day_id
    end

    validates :price, inclusion: { in:300..9999999 }
    validates :price, format: { with: /\A[0-9]+\z/ }
  end

  class Article < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :status
    belongs_to :shipping_cost
    belongs_to :prefecture
    belongs_to :shipping_day
  end
end
