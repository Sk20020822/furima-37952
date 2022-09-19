class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :cost
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :days

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "Out of setting range"}
  validates :price, numericality: { only_integer: true, message: "Half-width number." }
  validates :item_condition_id, numericality: { other_than: 0, message: "Select" }
  validates :postage_id, numericality: { other_than: 0, message: "Select" }
  validates :prefecture_id, numericality: { other_than: 0, message: "Select" }
  validates :prepare_id, numericality: { other_than: 0, message: "Select" }
  validates :category_id, numericality: { other_than: 0, message: "Select" }
  
end