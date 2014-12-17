require 'rails_helper'
require 'webmock/rspec'
include WebmockStubs

require_relative '../fixtures/test_data.rb'

describe 'posts/new.html.erb' do 
  
  context 'when more than one header photo is selected' do
    it "displays an error on the form" do 
      stub_s3_request
      assign(:post, Post.create(TestData::POST_WITH_MULTIPLE_HEADER_PHOTOS))
      render   
      expect(rendered).to have_content('You can only have one photo be your header photo')
    end
  end
  
end
