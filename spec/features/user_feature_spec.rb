require "rails_helper"

feature 'creating a user' do
  
  let(:user){ FactoryGirl.build(:new_user) }
  
  scenario 'with valid user data' do
    visit '/users/new'
    within('#user_form') do
      fill_in 'user_name', with: user.name
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      fill_in 'user_password_confirmation', with: user.password
      fill_in 'user_access_code', with: user.access_code
    end
    expect{
      click_button 'Create Account'
    }.to change(User, :count).by(1)
    
    page.should have_selector('#flash_success')
  end
  
  scenario 'with invalid user data' do
    visit '/users/new'
    within('#user_form') do
      fill_in 'user_name', with: ''
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      fill_in 'user_password_confirmation', with: user.password
      fill_in 'user_access_code', with: user.access_code
    end
    expect{
      click_button 'Create Account'
    }.to change(User, :count).by(0)
    
    
    current_path.should eql(users_path)
    page.should have_selector('#error_messages')
    page.should have_selector('#flash_error')
  end

end