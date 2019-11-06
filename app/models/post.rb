class Post < ActiveRecord::Base
    # All posts have a title
    validates :title, presence: true
    # Post content is at least 250 characters long
    validates :content, length: {minimum: 250}
    # Post summary is a maximum of 250 characters
    validates :summary, length: {maximum: 250}
    # Post category is either Fiction or Non-Fiction
    validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
    # Post title is sufficiently clickbait-y
    validate :clickbaity
    
    def clickbaity
        baits = ["Won't Believe", "Secret", "Top [number]", "Guess"]
        count = 0
        if self.title
            baits.each do |bait|
                if !self.title.include?(bait)
                    count += 1
                end
            end
        end
        if count == 4
            errors.add(:title, "Title not clickbait-y")
        end
    end
end
