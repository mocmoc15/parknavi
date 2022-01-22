class Comment < ApplicationRecord

 belongs_to :user
 belongs_to :park
 has_one_attached :image
 
#  validates :image, presence: true
validates :text, presence: true

#  def was_attached?
#    self.image.attached?
#  end



end
