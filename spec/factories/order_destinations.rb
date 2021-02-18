FactoryBot.define do
  factory :order_destination do
    post_code         {'123-4567'}
    prefecture_id     {2}
    city              {'テスト市'}
    address           {'テスト1番地1'}
    phone_number      {'08012345678'}
  end
end
