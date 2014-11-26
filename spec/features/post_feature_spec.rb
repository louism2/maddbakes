require "rails_helper"

feature 'creating a post' do
  
  let(:post){ FactoryGirl.build(:post) }
  let(:user){ FactoryGirl.create(:new_user) }
  
  scenario 'with valid data' do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    
    visit new_post_path
    
    within('#post_form') do
      fill_in 'post_content', with: post.content
      page.attach_file('post_photos_attributes_0_image_file', '/Users/louism2/rails_projects/queenie/spec/testing_utilities/honda.jpg')
    end
    
    expect{
      click_button 'Create Post'
    }.to change(Post, :count).by(1) & change(Photo, :count).by(1)
    
    page.should have_selector('#flash_success')
  end
  
end  