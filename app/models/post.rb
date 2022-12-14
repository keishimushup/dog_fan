class Post < ApplicationRecord
  has_one_attached :image

  validates :title, presence: true
  validates :image, presence: true
  validates :explanation, presence: true

  belongs_to :user
  belongs_to :genre, optional: true
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy


  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpeg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

end
