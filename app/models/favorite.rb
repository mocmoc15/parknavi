class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :park

  validates_uniqueness_of :park_id, scope: :user_id  #ユーザーと公園の組み合わせが一対一

end
