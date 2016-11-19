class Post < ApplicationRecord

  acts_as_votable
   has_attached_file :image, styles: { medium: "500x500>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/


  belongs_to :user, optional: true
  has_many :comments,  :class_name => "comments"
  has_many :category
end
