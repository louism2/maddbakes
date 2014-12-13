require 'rails_helper'
require 'webmock/rspec'
include WebmockStubs
include Session

describe 'posts/show.html.erb' do
  
  context 'a signed in user' do
    
    before(:each) do
      allow(view).to receive(:signed_in?).and_return(true)
      stub_s3_request
      FactoryGirl.create(:post_with_photos_and_comments)
    end
    
    it 'shows a link to delete the post' do
      assign(:post, Post.last)
      assign(:comment, Comment.new)
      render
      page = Capybara::Node::Simple.new(rendered)
      expect(page.has_css?('.destroy_post')).to eq(true)
    end
    
    it 'shows a link to delete a comment' do
      assign(:post, Post.last)
      assign(:comment, Comment.new)
      render
      page = Capybara::Node::Simple.new(rendered)
      expect(page.has_css?('.destroy_comment')).to eq(true)
    end
    
  end
  
  context 'no user is signed in' do
    
    before(:each) do
      stub_s3_request
      FactoryGirl.create(:post_with_photos_and_comments)
    end
    
    it 'doesn\'t show a delete link for the post' do
      assign(:post, Post.last)
      assign(:comment, Comment.new)
      render
      page = Capybara::Node::Simple.new(rendered)
      expect(page.has_css?('.destroy_post')).to eq(false)
    end
    
    it 'doesn\'t show a delete link for the comment' do
      assign(:post, Post.last)
      assign(:comment, Comment.new)
      render
      page = Capybara::Node::Simple.new(rendered)
      expect(page.has_css?('.destroy_comment')).to eq(false)
    end 
    
    
  end
    
end