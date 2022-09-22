class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :cost
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :days

  with_options presence: true do
   validates :image
   validates :description,  presence: true 
   validates :name,        presence: true 
   validates :price,        numericality:{only_integer: true,greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
   validates :status_id,       numericality: { other_than: 1 , message: "can't be blank"}
   validates :category_id,  numericality: { other_than: 1 , message: "can't be blank"}
   validates :cost_id, numericality: { other_than: 1 , message: "can't be blank"} 
   validates :prefecture_id,      numericality: { other_than: 1 , message: "can't be blank"} 
   validates :days_id, numericality: { other_than: 1 , message: "can't be blank"} 
  end
  
end