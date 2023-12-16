class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image
  
  has_many :movies, dependent: :destroy
  has_many :movie_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  validates :name, presence: true, length: { in: 1..20 }, uniqueness: true
  validates :introduction, length: { maximum: 30 }
end