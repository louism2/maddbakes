require "rails_helper"
require 'webmock/rspec'
require_relative "../support/webmock_stubs.rb"
include WebmockStubs
include Session
include AuthenticateTestUser

feature 'creating a comment' do

  let(:post){ FactoryGirl.create(:post) }
  let(:comment){ FactoryGirl.build(:comment) }
  let(:user){ FactoryGirl.create(:new_user) }

  scenario 'with valid comment data' do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit post_path(post)

    within('#comment_form') do
      fill_in 'comment_content', with: comment.content
      fill_in 'comment_commenter_name', with: comment.commenter_name
    end

    expect{
      click_button 'Submit Comment'
    }.to change(Comment, :count).by(1)

    expect(current_url).to eq(post_url(post.id))
    expect(page).to have_selector('#flash_success')
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

    expect(page).to have_selector('#flash_error')
    expect(page).to have_selector('#error_messages')
  end

end

feature 'destroying a comment' do
  
  before(:each) do
    @user = FactoryGirl.create(:new_user)
    set_current_user(@user)
    stub_s3_request
    @post = FactoryGirl.create(:post_with_photos_and_comments)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)   
  end
  
  scenario 'clicking the destroy_comment link' do
    visit post_path(@post)
    link = find('.destroy_comment:first-of-type')
    expect{
      link.click()
    }.to change(Comment, :count).by(-1)
    expect(current_url).to eq(root_url)
  end
  
end 