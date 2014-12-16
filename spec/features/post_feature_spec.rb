require "rails_helper"
require 'webmock/rspec'
include WebmockStubs

feature 'creating a post' do
  
  let(:post){ FactoryGirl.build(:post) }
  let(:user){ FactoryGirl.create(:new_user) }
  
  after(:each) do
    FileUtils.rm_rf("#{Rails.root}/public/system")
  end
  
  scenario 'with valid data' do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    allow_any_instance_of(PostsController).to receive(:signed_in?).and_return(true)
    stub_s3_request
    
    visit new_post_path

    within('#post_form') do
      fill_in 'post_content', with: post.content
      page.attach_file('post_photos_attributes_0_image_file', "#{Rails.root}/spec/fixtures/honda.jpg")
    end

    expect{
      click_button 'Create Post'
    }.to change(Post, :count).by(1) & change(Photo, :count).by(1)

    expect(page).to have_selector('#flash_success')
  end
  
  scenario 'with invalid data' do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    stub_s3_request
    
    visit new_post_path
    
    within('#post_form') do
      fill_in 'post_content', with: post.content
      page.attach_file('post_photos_attributes_0_image_file', "#{Rails.root}/spec/fixtures/test.txt")
    end
    
    expect{
      click_button 'Create Post'
    }.not_to change(Post, :count)
    
    expect(page).to have_selector('#error_messages')
    expect(page).to have_selector('#flash_error')
  end
  
end  