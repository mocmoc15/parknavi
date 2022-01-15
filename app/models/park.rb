class Park < ApplicationRecord

  validates :name, presence: true
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: "can't be blank"}

  belongs_to :user

end
