class User < ActiveRecord::Base
  
  
  
  attr_accessor :password, :password_confirmation
  
  before_save :encrypt_password, unless: Proc.new { |user| user.password.blank? }

  name_regex = /\A[a-zA-Z\s]{2,50}\z/i   
  password_regex = /\A(?=.*[A-Z]+)(?=.*[0-9]+).{8,}\z/
  email_regex = /\A[a-zA-Z0-9_]+@[a-zA-Z0-9\.]+\.[a-zA-Z]{2,3}\z/
  
  validates :name,      presence: true,
                        format: { with: name_regex, message: 'boo, that name must be only letters and less than 50 characters' }
                   
  validates :password,  confirmation: true,
                        format: { with: password_regex, message: 'boo, that password must be at least 8 characters with one or more capital letters and numbers' }, if: Proc.new { |user| user.new_record? || !user.password.blank? }
                        
  validates :email,     presence: true,
                        format: { with: email_regex, message: 'girl, check yoself!'}
                        
                      

                   
end