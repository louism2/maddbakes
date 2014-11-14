class User < ActiveRecord::Base
  
  include PasswordEncryption
  
  attr_accessor :password, :password_confirmation, :access_code
  
  before_validation :encrypt_password, unless: Proc.new { |user| user.password.blank? }

  NAME_FORMAT = /\A[a-zA-Z\s]{2,50}\z/i   
  PASSWORD_FORMAT = /\A(?=.*[A-Z]+)(?=.*[0-9]+).{8,}\z/
  EMAIL_FORMAT = /\A[a-zA-Z0-9_]+@[a-zA-Z0-9\.]+\.[a-zA-Z]{2,3}\z/
  ACCESS_CODE_FORMAT = /\Atwo d\'s one word\z/ 
  
  validates :name,                format: { with: NAME_FORMAT, message: 'boo, that name must be only letters and less than 50 characters' }
                   
  validates :password,            confirmation: true,
                                  format: { with: PASSWORD_FORMAT, message: 'boo, that password must be at least 8 characters with one or more capital letters and numbers' }, if: Proc.new { |user| user.new_record? || !user.password.blank? }
                        
  validates :email,               format: { with: EMAIL_FORMAT, message: 'girl, check yoself!'},
                                  uniqueness: true
                        
  validates :salt,                presence: true,
                                  allow_nil: false
                        
  validates :encrypted_password,  presence: true,
                                  allow_nil: false
                                  
  validates :access_code,         format: { with: ACCESS_CODE_FORMAT, message: 'girl, that aint the right code'}, if: Proc.new { |user| user.new_record?}
                      

  
                        
end