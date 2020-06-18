class TitleValidator < ActiveModel::Validator

    def validate(record)
        if record.title?
        record.errors[:title] << 'Not Click-baity!' unless record.title.match?(/Won't Believe|Secret|Top [number]|Guess/)
        end
    end
end
