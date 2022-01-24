class Park < ApplicationRecord
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  validates :name, presence: true
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: "can't be blank"}

  belongs_to :user
  has_many :comments
  has_many :favorites
  has_one_attached :image

end
