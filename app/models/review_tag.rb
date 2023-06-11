class ReviewTag < ApplicationRecord
    belongs_to :review, class_name: 'Review',foreign_key: :review_id
    belongs_to :tag, class_name: 'Review',foreign_key: :tag_id
end
