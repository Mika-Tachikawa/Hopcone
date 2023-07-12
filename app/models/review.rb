class Review < ApplicationRecord

  belongs_to :user
  has_many :review_comments, dependent: :destroy
  has_many :review_tags, dependent: :destroy
  has_many :tags, through: :review_tags
  has_many :favorites, dependent: :destroy

  has_one_attached :beer_image
  has_one_attached :profile_image

  validates :name, presence: true
  validates :brewery, presence: true
  validates :location, presence: true

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

  def save_tags(savereview_tags)
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    old_tags = current_tags - savereview_tags
    new_tags = savereview_tags - current_tags

    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(name:old_name)
    end

    new_tags.each do |new_name|
      review_tag = Tag.find_or_create_by(name:new_name)
      self.tags << review_tag
    end
  end

  def self.search_for(content, method)
    if method == 'perfect'
      Review.where(name: content)
    else
      Review.where('name LIKE ?', '%'+content+'%')
    end
  end

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

end
