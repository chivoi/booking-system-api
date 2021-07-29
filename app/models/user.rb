class User < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_secure_password
  validates :email,
            uniqueness: true,
            presence: true, 
            format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone_num, 
            presence: true, 
            :numericality => true, 
            :length => { :minimum => 7, :maximum => 15 } 
  validates :first_name, presence: true
  validates :last_name, presence: true
end
