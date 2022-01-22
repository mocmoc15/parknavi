class User < ApplicationRecord
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,  presence: true
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}

  has_many :parks
  has_many :comments

end
