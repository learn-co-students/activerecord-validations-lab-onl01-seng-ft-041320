
    class TitleValidator < ActiveModel::Validator
        def validate(record)
          unless record.title.match?("Won't Believe, Secret, Top [number], Guess")
            record.errors[:title] << "Title is not clickbaity enough"
          end
        end
      end

