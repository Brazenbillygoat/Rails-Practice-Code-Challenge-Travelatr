class Blogger < ApplicationRecord

  has_many :posts
  has_many :destinations, through: :posts

  validates :name, presence: true, uniqueness: {case_sensitive: false}
  validates :age, presence: true, numericality: {greater_than: 0}
  validates :bio, length: {minimum: 30}


  def find_most_liked_post
    organized_by_likes = self.posts.group(:likes)

    return organized_by_likes[-1]
  end
end
