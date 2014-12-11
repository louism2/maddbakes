require 'rails_helper'
require_relative '../fixtures/test_data.rb'

describe 'posts/new.html.erb' do 
  
  context 'when more than one header photo is selected' do
    it "displays an error on the form" do 
      assign(:post, Post.create(TestData::POST_WITH_MULTIPLE_HEADER_PHOTOS))
      render   
      rendered.should have_content('You can only have one photo be your header photo')
    end
  end
  
end

describe 'posts/edit.html.erb' do
  
  context 'when a post has photos' do
    
    before(:each) do
      FactoryGirl.create(:post_with_photos)
      @post = Post.last
    end
    
    it 'displays the list of photos' do
      assign(:post, @post)
      render
      page = Capybara::Node::Simple.new( rendered )
      expect(page.has_css?('img.thumbnail', :count => 2)).to be(true)
    end
  end
  
end