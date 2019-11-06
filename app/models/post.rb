class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :clickbaity?

    def clickbaity?
        phrases = [/Won't Believe/, /Secret/, /Top [0-9]/, /Guess/]
        bool = false
        phrases.each do |phrase|
            if title != nil and title.match(phrase)
                bool = true
            end
        end
        if !bool
            errors.add(:title, "Not Clickbaity enough")
        end
    end
end
