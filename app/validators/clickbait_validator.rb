class ClickbaitValidator < ActiveModel::EachValidator
    CLICKBAIT_TITLES = ["Won't Believe", "Secret", "Top", "Guess"]

    def validate_each(post, title, value)

        return post.errors[:title] << "You need a clickbait title!" if value.nil?

        title_contains_clickbait = false

        CLICKBAIT_TITLES.each do |clickbait|
            title_contains_clickbait = true if value.include?(clickbait)
        end

        unless title_contains_clickbait
            post.errors[:title] << "You need a clickbait title!"
        end

    end
end 