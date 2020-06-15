class TitleValidator < ActiveModel::Validator
    
    def validate(record)
       
        if record.title
            clickbait = ["Won't Believe", "Secret", "Top", "Guess"]
            
            unless clickbait.detect{ |r| record.title.include?(r) }
                record.errors[:title] << "Title must include clickbait"
          end
        end
    end

end 