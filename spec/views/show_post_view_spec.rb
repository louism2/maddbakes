require 'rails_helper'
require 'webmock/rspec'
include WebmockStubs
include Session

describe 'posts/show.html.erb' do
  
  before(:each) do
    stub_s3_request
    allow(view).to receive(:signed_in?).and_return(true)
    FactoryGirl.create(:post_with_photos)
    @post = Post.last
    @comment = Comment.new
  end
  
  context 'when a post has photos' do
    it 'displays the photo thumbnails' do
      assign(:post, @post)
      render
      page = Capybara::Node::Simple.new(rendered)
      expect(page.has_css?('img.thumbnail', :count => 2)).to be(true)
    end
  end
  
  context 'when a post has no photos' do
    it 'displays a "no photos" message' do
      @post.photos.destroy_all
      assign(:post, @post)
      render
      page = Capybara::Node::Simple.new(rendered)
      expect(page.has_text?('No photos to display'))
    end  
  end
end