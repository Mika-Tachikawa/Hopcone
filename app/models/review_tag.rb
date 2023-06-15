class ReviewTag < ApplicationRecord
    belongs_to :review, class_name: 'Review',foreign_key: :review_id
    belongs_to :tag, class_name: 'Review',foreign_key: :tag_id

  def self.search_for(content, method)
    if method == 'perfect'
      Review.where(title: content)
    elsif method == 'forward'
      Review.where('title LIKE ?', content+'%')
    elsif method == 'backward'
      Review.where('title LIKE ?', '%'+content)
    else
      Review.where('title LIKE ?', '%'+content+'%')
    end
  end

end
