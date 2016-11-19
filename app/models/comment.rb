class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product

 belongs_to :post,   :class_name => "User"
  belongs_to :post,    :foreign_key => :post_id

  validates :user_id, presence: true
  validates :post_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }

end
