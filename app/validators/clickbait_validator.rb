class ClickbaitValidator < ActiveModel::Validator 
    def validate(record)
        arr = [/Won't Believe/, /Secret/, /Top [0-9]/, /Guess/]
        if record.none? {|term| term.match title}
            record.errors[:title] << "This should be clickbait!"
        end
    end
end

