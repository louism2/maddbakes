require 'rails_helper'

describe Photo do
  
  describe 'factory' do
    it 'should produce a valid object' do
      p = FactoryGirl.build(:photo)
      expect(p).to be_valid
    end
  end
  
  describe 'validations' do
    describe 'attachment_content_type' do
      
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
  end
  
end