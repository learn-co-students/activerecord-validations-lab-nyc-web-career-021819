class Author < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :phone_number, numericality: true
  validates :phone_number, length: { is: 10 }
end








  # validate :phone_number_cannot_be_invalid
  #
  # def phone_number_cannot_be_invalid
  #   unless phone_number.present? && sanitized_phone_number(phone_number).length == 10
  #     errors.add(:phone_number, '- Please enter a valid phone number (e.g. 555-555-5555)')
  #   end
  # end
  #
  # private
  #
  # def sanitized_phone_number(phone_number)
  #   phone_number.split("-").join.split("(").join.split(")").join.split(" ").join
  # end
