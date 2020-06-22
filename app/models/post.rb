class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validate :must_be_clickbait

    def must_be_clickbait
        clickbait_words = ["Won't Believe", "Secret", "Top", "Guess"]
        if title != nil && !clickbait_words.any?{|word| title.include?(word)}
            errors.add(:title, "must be clickbait")
        end
    end
end
