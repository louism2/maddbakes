require "rails_helper"

feature 'creating a comment' do
  
  let(:post){ FactoryGirl.create(:post) }
  let(:comment){ FactoryGirl.build(:comment) }
  
  scenario 'with valid comment data' do
    visit post_path(post)
    
    within('#comment_form') do
      fill_in 'content', with: comment.content
      fill_in 'commenter_name', with: comment.commenter_name
    end
    expect{
      click_button 'Submit Comment'
    }.to change(Comment, :count).by(1)
    
    page.should have_selector('#flash_success')
  end
  
end  