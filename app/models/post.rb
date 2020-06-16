class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-fiction)}
    validate :clickbait, on: :create

    def clickbait
    
        title_words = ["Won't Believe", "Secret", "Top", "Guess"]
        title_words.each do |t|

            if self.title != nil

                if self.title.include?(t)
                    return true
                end 
            end 
        end
            self.errors.add(:title , "Title is not clickbaity enough")
        end

end

