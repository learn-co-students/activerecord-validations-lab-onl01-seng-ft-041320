class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction),
    message: "%{value} is not a valid category" }
    validate :clickbait

    def clickbait
        clickbait = Regexp.new("(Won't Believe)|(Top) \d*|(Secret)|(Guess)")
        if title && !title.match?(clickbait)
          errors.add(:title, "That's not clickbait!")
        end
    end

end
