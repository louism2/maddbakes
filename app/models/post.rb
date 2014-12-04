class Post < ActiveRecord::Base
  
  has_many :photos, dependent: :destroy
  has_one  :header_photo, ->{ where('header_photo = true') }, class_name: 'Photo'  
  has_many :comments, dependent: :destroy
  
  accepts_nested_attributes_for :photos
  validates_associated :photos

  validates :content,   presence: true,
                        length: {maximum: 3000}
                        
                        
  def photos_attributes=(attributes_hash)
    attributes_hash.each_value do |uploaded_file|
      photos.build(uploaded_file)
    end  
  end 
  
  def self.post_previews
    Post.includes(:header_photo)
  end                       
                          

end