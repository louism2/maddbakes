class Post < ActiveRecord::Base
  
  has_many :photos, :inverse_of => :post, dependent: :destroy
  has_one  :header_photo, ->{ where('header_photo = true') }, class_name: 'Photo'  
  has_many :comments, dependent: :destroy

  accepts_nested_attributes_for :photos
  validates_associated :photos

  validates :content,   presence: true,
                        length: {maximum: 3000}
                        
  
  def self.post_previews
    Post.includes(:header_photo)
  end
                          

end