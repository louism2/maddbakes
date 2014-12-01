module TestData
  
  def self.create_invalid_image
    # should be invalid due to the :type attribute.  txt is not an accepted file format
    ActionDispatch::Http::UploadedFile.new({
      :filename => 'test.txt',
      :type => 'txt',
      :tempfile => File.new("#{Rails.root}/spec/fixtures/test.txt")
    })
  end
  
  def self.create_valid_image
    ActionDispatch::Http::UploadedFile.new({
      :filename => 'honda.jpg',
      :type => 'image/jpeg',
      :tempfile => File.new("#{Rails.root}/spec/fixtures/honda.jpg")
    })    
  end  
  
  POST_WITH_INVALID_PHOTO_PARAMS = {"content"=>"Here is some content for the post Factory.  Here is some more text.", 
                                    "photos_attributes"=>{"0"=>{"image_file"=>TestData::create_invalid_image}}}
                                    
  POST_WITH_VALID_PHOTO_PARAMS = {"content"=>"Here is some content for the post Factory.  Here is some more text.", 
                                  "photos_attributes"=>{"0"=>{"image_file"=>TestData::create_valid_image}}}

end