class Tag < ApplicationRecord
  
  has_many :review_tags, dependent: :destroy, foreign_key: 'tag_id'
  has_many :reviews, through: :review_tags
  
  scope :merge_reviews, -> (tags){ }
  
  def self.search_reviews_for(content, method)
    
    if method == 'perfect'
      tags = Tag.where(name: content)
    else
      tags = Tag.where('name LIKE ?', '%' + content + '%')
    end
    
    return tags.inject(init = []) {|result, tag| result + tag.reviews}
    
  end
  
end
