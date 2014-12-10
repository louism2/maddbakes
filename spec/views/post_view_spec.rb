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