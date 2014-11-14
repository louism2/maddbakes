class Post < ActiveRecord::Base
  
  has_many :photos
  validates_associated :photos


end