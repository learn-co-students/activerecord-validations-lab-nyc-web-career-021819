class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250}
  validates :summary, length: { maximum: 250}
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"]}
  validate :title_must_be_clickbaity

  def title_must_be_clickbaity
    unless contain_clickbaity_words?(title)
      errors.add(:title, '- Please enter a clickbaity title')
    end
  end

  private

  def contain_clickbaity_words?(title)
    if title =~ /Won't Believe/
      return true
    elsif title =~ /Secret/
      return true
    elsif title =~ /Top/
      return true
    elsif title =~ /Guess/
      return true
    else
      return false
    end
  end

end
