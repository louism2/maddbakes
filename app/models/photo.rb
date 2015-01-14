class Photo < ActiveRecord::Base
  
  belongs_to :post, :inverse_of => :photos
  
  has_attached_file :image_file, :storage => :s3,
                                 :s3_credentials => "#{::Rails.root.to_s}/config/s3.yml",
                                 :path => "photos/:id/:style.jpg",
                                 :bucket => 'maddbakes'
  
  validates_attachment_content_type :image_file, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  
  
  def save(*args)
    super
  rescue ActiveRecord::RecordNotUnique => error
    post.errors[:base] << "You can only have one photo be your header photo.  Try your selection again"
    false
  end
  
  def self.all_photos_by_year
    Photo.all.order(image_file_updated_at: :desc).group_by{ |photo| photo.image_file_updated_at.year }
  end  
  
  
end
