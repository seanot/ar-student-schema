require_relative '../../db/config'

class Student < ActiveRecord::Base
  
  validates :email, format: { with: /\w+@*\w*.*\w*@\w+.[a-z]{2,3}/,
    message: 'only valid email addresses allowed' }
  validates :email, uniqueness: true
  validates :age, inclusion: { in: (4..120) }
  validates :phone, format: { with: /\(?(\d{3})\)?.?(\d{3}).?(\d{4})/,
    message: 'only valid phone numbers allowed' }  

  def name
    first_name + ' ' + last_name
  end

  def age
    now = DateTime.now
    age = now.year - birthday.year
    age -= 1 if(now.yday < birthday.yday)
    age
  end



end

# Email addresses must contain at least one @ character and one . character, with at least one character before the @, one character between the @ and first ., and at least two characters after the final ..