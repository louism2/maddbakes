class Post < ActiveRecord::Base
  
  has_many :photos, dependent: :destroy
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
                          

end