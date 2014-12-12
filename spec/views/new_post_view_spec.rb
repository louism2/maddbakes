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

describe 'posts/edit.html.erb' do
  
  context 'a post with photos' do
    
    before(:each) do
      stub_s3_request
      FactoryGirl.create(:post_with_photos)
      @post = Post.last
    end
    
    it 'the photos are displayed' do
      assign(:post, @post)
      render
      page = Capybara::Node::Simple.new(rendered)
      expect(page.has_css?('img.thumbnail', :count => 2)).to be(true)
    end
    
    it 'the photos have a "make header image" checkbox' do
      assign(:post, @post)
      render
      page = Capybara::Node::Simple.new(rendered)
      expect(page.has_css?('input[type="checkbox"]', count: 2)).to be(true)
    end
    
    it 'the photos have a "destroy photo" icon' do
      assign(:post, @post)
      render
      page = Capybara::Node::Simple.new(rendered)
      expect(page.has_css?('img.destroy_photo', count: 2)).to be(true)
    end
  end
  
end
