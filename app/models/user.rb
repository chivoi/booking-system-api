class User < ApplicationRecord
  has_secure_password
  validates :email, 
            presence: true, 
            format: { with: URI::MailTo::EMAIL_REGEXP }
            # message: "Please enter a valid email address. Ex: email@test.com"
  validates :phone_num, 
            presence: true, 
            :numericality => true, 
            :length => { :minimum => 7, :maximum => 15 } 
            # message: "Please enter numbers only, no spaces or other characters. If it's an international number, prepend it with 00 like this: 0074956784567"
  validates :first_name, presence: true
  validates :last_name, presence: true
end
