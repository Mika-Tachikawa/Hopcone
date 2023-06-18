class Review < ApplicationRecord

  belongs_to :user
  has_many :review_comments, dependent: :destroy
  has_many :review_tags, dependent: :destroy
  has_many :tags, through: :review_tags

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

  #def save_tag(sent_tags)
    #current_tags = self.tags.pluck(:name) unless self.tags.nil?
    #old_tags = current_tags - sent_tags
    #new_tags = sent_tags - current_tags
    #old_tags.each do |old|
     #self.review_tags.delete ReviewTag.find_by(name: old)
    #end
   # new_tags.each do |new|
      #new_review_tag = ReviewTag.find_or_create_by(name: new)
     # self.review_tags << new_review_tag
   # end
 # end

  #def save_tags(savereview_tags)
    # 現在のユーザーの持っているskillを引っ張ってきている
    #current_review_tags = self.review_tags.pluck(:name) unless self.review_tags.nil?
    # 今bookが持っているタグと今回保存されたものの差をすでにあるタグとする。古いタグは消す。
    #old_review_tags = current_review_tags - savereview_tags
    # 今回保存されたものと現在の差を新しいタグとする。新しいタグは保存
    #new_review_tags = savereview_tags - current_review_tags

    # Destroy old taggings:
    #old_review_tags.each do |old_name|
      #self.review_tags.delete ReviewTag.find_by(name:old_neme)
    #end

    # Create new taggings:
    #new_review_tags.each do |new_name|
      #review_tag = ReviewTag.find_or_create_by(name:new_name)
      # 配列に保存
      #self.review_tags << review_tag
    #end
  #end
  
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

end
