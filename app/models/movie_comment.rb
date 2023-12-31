class MovieComment < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  
  validates :comment, presence: true, length: { maximum:50 }
end