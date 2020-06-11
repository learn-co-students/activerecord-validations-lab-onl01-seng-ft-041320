class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :title_is_clickbaity

  def title_is_clickbaity
    if self.title.present? && !self.title[/Won't Believe|Secret|Top [\d+]|Guess/]
      errors.add(:title, "must include 'Won't Believe', 'Secret', 'Top [number]', or 'Guess'")
    end
  end
end
