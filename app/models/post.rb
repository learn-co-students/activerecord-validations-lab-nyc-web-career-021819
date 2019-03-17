class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :title, uniqueness: true
  validates :content, length: { minimum: 250}
  validates :summary, length: { maximum: 250}
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"]}
  validate :clickbait?

  def contain_words(title)
    if title =~ /Won't Believe/ || /Secret/ || /Top[number]/ || /Guess/
      return true
    else
      return false
    end
  end

  def clickbait?
    unless contain_words(title)
      errors.add(:title, 'Please enter a clickbait title')
    end
  end

end
