require 'rails_helper'
require 'webmock/rspec'
include WebmockStubs
include Session

describe 'posts/edit.html.erb' do
  
  context 'a post with photos' do
    
    before(:each) do
      stub_s3_request
      allow(view).to receive(:signed_in?).and_return(true)
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
      expect(page.has_css?('input.header_photo')).to be(true)
    end
    
    it 'the photos have a "make cover photo" checkbox' do
      assign(:post, @post)
      render
      page = Capybara::Node::Simple.new(rendered)
      expect(page.has_css?('input.cover_photo', count: 2)).to be(true)
    end
    
    it 'the photos have a "destroy photo" icon' do
      assign(:post, @post)
      render
      page = Capybara::Node::Simple.new(rendered)
      expect(page.has_css?('img.destroy_photo', count: 2)).to be(true)
    end
  end
  
end