require "rails_helper"

feature 'creating a comment' do
  
  let(:post){ FactoryGirl.create(:post) }
  let(:comment){ FactoryGirl.build(:comment) }
  
  scenario 'with valid comment data' do
    visit post_path(post)
    
    within('#comment_form') do
      fill_in 'comment_content', with: comment.content
      fill_in 'comment_commenter_name', with: comment.commenter_name
    end
    
    expect{
      click_button 'Submit Comment'
    }.to change(Comment, :count).by(1)
    
    expect(current_url).to eq(post_url(post.id))
    page.should have_selector('#flash_success')
  end
  
  scenario 'with invalid comment data' do
    visit post_path(post)
    
    within('#comment_form') do
      fill_in 'comment_content', with: ''
      fill_in 'comment_commenter_name', with: comment.commenter_name
    end
    
    expect{
      click_button 'Submit Comment'
    }.not_to change(Comment, :count)
    
    page.should have_selector('#flash_error')
    page.should have_selector('#error_messages')
  end
  
end  