class Photo < ActiveRecord::Base
  
  belongs_to :post
  
  has_attached_file :image_file
  
  validates_attachment_content_type :image_file, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  
  
  
  
end
