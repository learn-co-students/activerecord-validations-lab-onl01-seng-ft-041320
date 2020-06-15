class ClickbaitValidator < ActiveModel::Validator
  def validate(record)
    if record.title.present?
      if !record.title.include? "Won't Believe" || "Secret" || "Top [number]" || "Guess"
        record.errors[:title] << "Invalid Title"
      end
    else
       record.errors[:title] << "Title can't be blank"
   end
  end
end
