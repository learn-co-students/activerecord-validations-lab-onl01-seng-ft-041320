class Post < ActiveRecord::Base
    include ActiveModel::Validations
    validates :title, presence: true
    validates :content, length: {minimum: 10}
    validates :summary, length: {maximum: 20}
    validates :category, inclusion: { in: ["Fiction", "Non-Fiction"]  }
    validates_with TitleValidator
end
