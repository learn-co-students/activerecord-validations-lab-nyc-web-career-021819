
class PostValidator < ActiveModel::Validator
    def validate(post)
        if !post.title.nil?
        unless post.title.include?('Won\'t Believe') || post.title.include?('Secret') || post.title.include?('Top') || post.title.include?('Guess')
          post.errors[:title] << 'This is not clickbait!'
        end
    end
    end
end

class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validates_with PostValidator
end


