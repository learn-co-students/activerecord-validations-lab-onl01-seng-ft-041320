class Post < ActiveRecord::Base
    include ActiveModel::Validations
    validates :title, presence: true, :exclusion => { :in => %w(Won't Believe Secret Top [0-9]* Guess) }
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validates_with ClickbaitValidator


    
end
