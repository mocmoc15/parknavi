class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates_uniqueness_of :park_id, scope: :user_id 

end
