require "rails_helper"

feature 'creating a post' do
  
  let(:post){ FactoryGirl.build(:post) }
  let(:user){ FactoryGirl.create(:new_user) }
  
  scenario 'with valid data' do
    visit new_post_path
    
    within('#post_form') do
      fill_in 'post_content', with: post.content
    end
    click_button 'Create Post'
    current_path.should eql(root_path)
    page.should have_selector('#flash_success')
    
    
    
  end
  
  
end  