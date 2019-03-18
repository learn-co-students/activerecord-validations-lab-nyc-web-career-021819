class MyValidator < ActiveModel::Validator
    def validate(post)
        if post.title != nil
            unless post.title.match(/Won't Believe|Secret|Guess|Top \d+/)
                post.errors[:name] << "false"
            end
        end
    end
end

class Post < ActiveRecord::Base
    include ActiveModel::Validations
    validates :title, presence: true
    validates :content, length: { minimum: 250}
    validates :summary, length: { maximum: 250}
    validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
    validates_with MyValidator
end
