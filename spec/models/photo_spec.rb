require 'rails_helper'
require 'webmock/rspec'
include WebmockStubs

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
        stub_s3_request
        FactoryGirl.create(:post_with_photos_and_comments)
      end
      
      after(:each) do
        FileUtils.rm_rf("#{Rails.root}/public/system")
      end
      
      let(:photos){ Post.last.photos }  
      
      it 'only allows one header photo' do
        photos.first.update_attribute(:header_photo,true)
        expect(photos.last.update_attribute(:header_photo, true)).to be(false)
      end
    end
   end
   
  describe 's3 storage for images' do
    
    before(:each) do
      stub_s3_request
      FactoryGirl.create(:post_with_photos_and_comments)
    end
    
    
    it 'saves images to s3' do
      expect(WebMock).to have_requested(:put, /.*amazonaws.*/).twice
    end
  end
  
  describe '::all_photos_by_year' do
    
    before(:each) do
      stub_s3_request
      4.times{ FactoryGirl.create(:photo) }
      photos = Photo.limit(2)
      photos.each do |photo|
        photo.image_file_updated_at = DateTime.new(2001,2,3,4,5,6,'+7')
      end  
    end
    
    it 'groups the photos by month' do
      photos_hash = Photo.all_photos_by_year
      expect(photos_hash.keys.length).to eq(2)
    end
     
  end
  
end