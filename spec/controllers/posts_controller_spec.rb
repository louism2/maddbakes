require 'rails_helper'
require 'webmock/rspec'
include WebmockStubs

require_relative '../fixtures/test_data.rb'

describe PostsController do 

  describe '#update' do
  
    let(:user){FactoryGirl.create(:new_user)}
    let(:post){FactoryGirl.create(:post_with_photos_and_comments)}
  
    it 'should remove any photos marked for destruction' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      stub_s3_request    
      expect{
        put :update, id: post.id, post: TestData.photos_marked_for_destruction_params(*post.photos.ids)
      }.to change(Photo, :count).by(2)
    end

  end
  
end  
