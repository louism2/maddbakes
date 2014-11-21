require "rails_helper"

feature 'creating a user' do
  
  let(:user){ FactoryGirl.build(:new_user) }
  
  scenario 'with valid user data' do
    expect_any_instance_of(ApplicationController).to receive(:sign_in)
    
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
    expect_any_instance_of(ApplicationController).not_to receive(:sign_in)
    
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

feature 'updating a user' do
  
  let(:user){ FactoryGirl.create(:new_user) }
    
    scenario 'with valid user data' do
      
      mock_object = instance_double('ActionDispatch::Request')
      allow(mock_object).to receive(:cookies).and_return([user.id, user.salt] )
      
      visit edit_user_path(user.id)
      within('#user_form') do
        fill_in 'user_name', with: user.name
        fill_in 'user_email', with: user.email
        fill_in 'user_password', with: user.password
        fill_in 'user_password_confirmation', with: user.password
        fill_in 'user_access_code', with: user.access_code
      end
      click_button 'Update Account'
      #current_path.should eql(user_path(user))
      page.should have_selector('#flash_success')
    end
  
end  