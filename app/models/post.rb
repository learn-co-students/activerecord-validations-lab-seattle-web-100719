class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 10 }
    validates :summary, length: { maximum: 10 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validate :non_clickbait

    def non_clickbait
        if self.title != nil && !(self.title.include?("Won't Believe") || self.title.include?("Secret") || self.title.include?("Top [number]") || self.title.include?("Guess"))
            errors.add(:expiration_date, "not clickbaity enough")
        end
    end
end
