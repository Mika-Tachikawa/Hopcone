class Tag < ApplicationRecord
  
  has_many :review_tag, dependent: :destroy
  has_many :reviews, through: :review_tag, dependent: :destroy
  
  def self.search_for(content, method)
    if method == 'perfect'
      Tag.where(title: content)
    elsif method == 'forward'
      Tag.where('title LIKE ?', content+'%')
    elsif method == 'backward'
      Tag.where('title LIKE ?', '%'+content)
    else
      Ta.where('title LIKE ?', '%'+content+'%')
    end
  end
  
end
