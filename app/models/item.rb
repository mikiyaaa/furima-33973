class Item < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :item_name
    validates :description
    validates :category_id, numericality: { other_than: 1 }
    validates :status_id, numericality: { other_than: 1 }
    validates :shipping_cost_id, numericality: { other_than: 1 }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :shipping_day_id, numericality: { other_than: 1 }
    validates :price
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
