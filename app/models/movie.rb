class Movie < ApplicationRecord
  belongs_to :user
  has_many :movie_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  validates :title, presence: true
  validates :body, presence: true, length: { maximum:200 }
  validates :genre, presence: true

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end