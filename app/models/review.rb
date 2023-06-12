class Review < ApplicationRecord
  
  belongs_to :user
  has_many :review_tag, dependent: :destroy
  has_many :tags, through: :review_tag, dependent: :destroy
  
  has_one_attached :beer_image
  has_one_attached :profile_image
  
  def get_beer_image(width, height)
    unless beer_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      beer_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    beer_image.variant(resize_to_limit: [width, height]).processed
  end
  
  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

end
