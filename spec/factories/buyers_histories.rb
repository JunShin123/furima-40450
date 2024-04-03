FactoryBot.define do
  factory :buyer_history do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '東京都' }
    street { '1-1' }
    building { '東京ハイツ' }
    phone_number { '00011112222' }
    token { 'ttt_aaaaaa222222222222' }
  end
end
