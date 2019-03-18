class Post < ActiveRecord::Base
  validate :non_clickbait
  validates :content, length: {:minimum => 250}
  validates :summary, length: {:maximum => 250}
  validates :category, :inclusion=> { :in => ["Fiction", "Non-Fiction"]}


  def non_clickbait
    if self.title
      if first_title_test_checker(self.title) || second_title_test_checker(self.title)
        true
      else
        errors.add(:title, "It's not clickbait")
        false
      end
    else
      errors.add(:title, "It doesn't have a title")
      false
    end
  end

  def title_test_by_string?(wanted_string,title)
    !!title.match(wanted_string)
  end

  def first_title_test_checker(title)
    ["Won't Believe", "Secret", "Guess"].select do |wanted_string|
      title_test_by_string?(wanted_string,title)
    end.length > 0
  end

  def second_title_test_checker(title)
    !!title.match(/Top +\d/)
  end

end
