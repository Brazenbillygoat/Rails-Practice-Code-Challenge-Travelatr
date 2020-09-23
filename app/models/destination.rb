class Destination < ApplicationRecord

has_many :posts
has_many :bloggers, through: :posts


  def five_most_recent
    ordered = self.posts.sort_by { |post| post["created_at"]}


    return ordered
  end

end
