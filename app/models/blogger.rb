class Blogger < ApplicationRecord

  has_many :posts
  has_many :destinations, through: :posts

  validates :name, presence: true, uniqueness: {case_sensitive: false}
  validates :age, presence: true, numericality: {greater_than: 0}
  validates :bio, length: {minimum: 30}
end
