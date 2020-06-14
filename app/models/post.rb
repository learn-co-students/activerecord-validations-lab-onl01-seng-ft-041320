class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction), message: "%{value} is not a category" }
  validate :title_clickbaitish

  def title_clickbaitish
    unless title&.match?(/(Won't Believe)|Secret|(Top \d+)|Guess/)
      errors.add(:title, "Title isn't clickbait-ish enough!")
    end
  end
end
