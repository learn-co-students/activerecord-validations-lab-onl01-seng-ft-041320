class TitleValidator < ActiveModel::Validator
    def validate(record)
        return if record.title == nil
        clickbait_part = ["Won't Believe", "Secret", "Top", "Guess"]
        unless clickbait_part.any? { |part| record.title.include?(part) }
            record.errors[:title] << "Need more clickbait!"
        end
    end
end