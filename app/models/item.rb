class Item < ApplicationRecord
  validates :image, presence: true
  validates :name, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true, numericality: { other_than: 0}
  validates :condition_id, presence: true, numericality: { other_than: 0}
  validates :shipping_price_id, presence: true, numericality: { other_than: 0}
  validates :prefecture_id, presence: true, numericality: { other_than: 0}
  validates :shipment_day_id, presence: true, numericality: { other_than: 0}
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, only_integer: true}

  has_one_attached :image
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_price
  belongs_to :prefecture
  belongs_to :shipment_day

end
