class TitleValidator < ActiveModel::Validator
    def validate(record)
       if record.title
         clickbait = ["Won't Believe", "Secret", "Top", "Guess"]
         unless clickbait.detect{ |t| record.title.include?(t) }
            record.errors[:title] << "hey you must include a clickbait!"
          end
        end
    end
end