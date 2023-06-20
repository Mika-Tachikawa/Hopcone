class Tag < ApplicationRecord
  
  has_many :review_tags, dependent: :destroy, foreign_key: 'tag_id'
  has_many :reviews, through: :review_tags
  
  scope :merge_reviews, -> (tags){ }
  
  def self.search_reviews_for(content, method)
    
    if method == 'perfect'
      tags = Tag.where(name: content)
    #elsif method == 'forward'
      #tags = Tag.where('name LIKE ?', content + '%')
    #elsif method == 'backward'
      #tags = Tag.where('name LIKE ?', '%' + content)
    else
      tags = Tag.where('name LIKE ?', '%' + content + '%')
    end
    
    return tags.inject(init = []) {|result, tag| result + tag.reviews}
    
  end
  
  #def self.search_for(content, method)
    #if method == 'perfect'
      #Tag.where(title: content)
    #elsif method == 'forward'
      #Tag.where('title LIKE ?', content+'%')
    #elsif method == 'backward'
      #Tag.where('title LIKE ?', '%'+content)
    #else
      #Ta.where('title LIKE ?', '%'+content+'%')
    #end
  #end
  
end
