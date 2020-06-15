class ClickbaitValidator < ActiveModel::Validator

    def validate(data)
        if data.title.present?
            if !data.title.include? "Won't Believe" || "Secret" || "Top [number]" || "Guess"
                data.errors[:title] << "Invalid Title"
            end
        else
            data.errors[:title] << "Title can't be blank"
        end
    end

end