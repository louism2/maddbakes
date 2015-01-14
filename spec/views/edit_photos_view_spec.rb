require 'rails_helper'
require 'webmock/rspec'
include WebmockStubs

describe 'photos/index.html.erb' do
    
  describe 'photo thumbnails' do
  
    before(:each) do
      stub_s3_request
      2.times{ FactoryGirl.create(:post_with_photos) }
      @photos = Photo.all_photos_by_year
    end 
    
    context 'when a user is signed in' do
      
      before(:each) do
        allow(view).to receive(:signed_in?).and_return(true)
      end
      
      it 'displays the .delete_photo icon' do
        assign(:photos_hash, @photos)
        render
        page = Capybara::Node::Simple.new(rendered)
        expect(expect(page.has_css?('.destroy_photo')).to be(true))
      end
      
      it 'displays the .cover_photo checkbox' do
        assign(:photos_hash, @photos)
        render
        page = Capybara::Node::Simple.new(rendered)
        expect(expect(page.has_css?('.cover_photo')).to be(true))  
      end    
    end
    
    context 'when there is no current_user' do
      it 'the .delete_photo icon is not displayed' do
        assign(:photos_hash, @photos)
        render
        page = Capybara::Node::Simple.new(rendered)
        expect(expect(page.has_css?('.delete_photo')).to be(false))  
      end
      
      it 'the .cover_photo checkbox is not displayed' do
        assign(:photos_hash, @photos)
        render
        page = Capybara::Node::Simple.new(rendered)
        expect(expect(page.has_css?('.cover_photo')).to be(false))  
      end 
    end
  
  end
    
    
  
end  