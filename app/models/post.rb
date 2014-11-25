class Post < ActiveRecord::Base
  
  has_many :photos
  validates_associated :photos

  validates :content,   presence: true,
                        length: {maximum: 3000}
                             


end