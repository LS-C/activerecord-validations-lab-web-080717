class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :summary, length: { maximum: 250 }
    validates :content, length: { minimum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validate :title_check

    def title_check

        if self.title

        includes_click_bait = ["Won't Believe", "Secret", "Guess"].any? do |key|
                self.title.include?(key)
                end

        includes_top_ten = !!self.title.match("/Top [0-9]/")

        if !includes_click_bait && !includes_top_ten
             self.errors.add(:title, "Title cannot contain the entered title")
         end

     end

    end

end
