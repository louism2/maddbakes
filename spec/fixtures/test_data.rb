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
                                  
  POST_WITH_MULTIPLE_HEADER_PHOTOS = {"content"=>"Here is some content for the post Factory.  Here is some more text.", 
                                      "photos_attributes"=>{"0"=>{"image_file"=>TestData::create_valid_image, "header_photo"=>'true'},
                                                            "1"=>{"image_file"=>TestData::create_valid_image, "header_photo"=>'true'}  
                                                        }
                                     }
                                                                   
                                     
                                     
  ## spec/controllers/posts_controller_spec ##
  ## - used for mimicking form params with  ##
  ## photos marked for destruction          ##                                    

  def self.photos_marked_for_destruction_params(*photo_ids) 
    photos_attributes = {}
    photo_ids.each_with_index do |id, index| 
      photos_attributes[index] = {id: id, _destroy: 1, header_photo: false}
    end
    {photos_attributes: photos_attributes}
  end  

end

