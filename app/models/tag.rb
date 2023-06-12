class Tag < ApplicationRecord
  
  has_many :review_tag, dependent: :destroy
  has_many :reviews, through: :review_tag, dependent: :destroy
  
end
