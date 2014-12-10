class Photo < ActiveRecord::Base
  
  belongs_to :post, :inverse_of => :photos
  delegate :save, to: :post
  
  has_attached_file :image_file
  
  validates_attachment_content_type :image_file, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  
  
  def save(*args)
    super
  rescue ActiveRecord::RecordNotUnique => error
    post.errors[:base] << "You can only have one photo be your header photo.  Try your selection again"
    false
  end
  
end
