class TitleValidator < ActiveModel::Validator

    #[Won't Believe|Secret|Top*[0-9]|Guess]
def validate(record)
    unless record.title.match?(`/\[ /Won't Believe/i, /Secret/i, /Top [0-9]*/i, /Guess/i ]/`)
        record.errors[:title] << "must be click bait"
    end
end

end