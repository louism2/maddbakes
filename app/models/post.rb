class Post < ActiveRecord::Base
  
  has_many :photos
  validates_associated :photos

  validates :comment,   presence: true,
                        length: {maximum: 300}
                        
  validates :author,    length: {maximum: 50}                      


end