class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum:250}
  validates :summary, length: {maximum:250}
  validates :category, inclusion: { in: %w(Non-Fiction Fiction),
    message: "%{value} is not a valid category" }

  validate :ensures_title_is_clickbait?


  CLICKBAIT_TITLES = [
    /Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i
  ]
    
  def ensures_title_is_clickbait?
    if CLICKBAIT_TITLES.none? { |t| t.match title }
      errors.add(:title, "needs more cowbell")
    end
  end

end


