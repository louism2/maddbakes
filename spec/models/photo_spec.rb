require 'rails_helper'

describe Photo do
  
  describe 'factory' do
    it 'should produce a valid object' do
      p = FactoryGirl.build(:photo)
      expect(p).to be_valid
    end
  end
  
  describe 'validations' do
    describe '@attachment_content_type' do
      
      let(:photo){ Photo.new } 
      
      it 'jpg should be valid' do
        photo.image_file_content_type = 'image/jpg'
        expect(photo).to be_valid
      end
      
      it 'jpeg should be valid' do
        photo.image_file_content_type = 'image/jpeg'
        expect(photo).to be_valid
      end
      
      it 'png should be valid' do
        photo.image_file_content_type = 'image/png'
        expect(photo).to be_valid
      end
      
      it 'gif should be valid' do
        photo.image_file_content_type = 'image/gif'
        expect(photo).to be_valid
      end
    end
    
    describe '@header_photo' do
      
      before(:each) do
        FactoryGirl.create(:post_with_photos_and_comments)
      end
      
      let(:photos){ Post.last.photos }  
      
      it 'should only allow one header photo' do
        photos.first.update_attribute(:header_photo,true)
        expect{photos.last.update_attribute(:header_photo, true)}.to raise_error()
      end
    end
  end
  
end