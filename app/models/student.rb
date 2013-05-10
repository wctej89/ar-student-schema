require_relative '../../db/config'
require 'date'

# implement your Student model here
class Student < ActiveRecord::Base
  validates :email, :format => { :with => /.+@.+\.\S{2,}/, :message => "Please enter a valid email address."}
  validates :email, :uniqueness => true
  validates :age, :numericality => {:greater_than => 5}
  validate :phone_number_must_contain_more_than_nine_digits

  def age
    Time.now.year - birthday.year - ((Time.now.month > birthday.month || (Time.now.month == birthday.month && Time.now.day >= birthday.day)) ? 0 : 1 )
  end

  def name
    "#{first_name} #{last_name}"
  end

  def phone_number_must_contain_more_than_nine_digits
    if phone.split(//).select{|d| d.to_i if d.to_i > 0 || d == "0" }.count < 9
      errors.add(:phone, "Phone number must contain more than 9 digits.")
    end
  end
end
