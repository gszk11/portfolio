class Movie < ApplicationRecord
  belongs_to :user
  has_many :movie_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
  validates :title, presence: true
  validates :body, presence: true, length: { maximum:100 }
  validates :genre, presence: true
  
  def self.search(search)
    if search != ""
      Movie.where(['title LIKE(?) OR genre LIKE(?)', "%#{search}%", "%#{search}%"])
    else 
      Movie.none
    end
  end
end