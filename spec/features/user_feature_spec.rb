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
    
    
    expect(page).to have_selector('#flash_success')
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
      
      
      expect(current_path).to eql(users_path)
      expect(page).to have_selector('#error_messages')
      expect(page).to have_selector('#flash_error')
    end

end

feature 'updating a user' do
  
  let(:user){ FactoryGirl.create(:new_user) }
    
    scenario 'with valid user data' do
      
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      
      visit edit_user_path(user.id)
      
      within('#user_form') do
        fill_in 'user_name', with: user.name
        fill_in 'user_email', with: user.email
        fill_in 'user_password', with: user.password
        fill_in 'user_password_confirmation', with: user.password
        fill_in 'user_access_code', with: user.access_code
      end
      click_button 'Update Account'
      expect(current_path).to eql(user_path(user))
      expect(page).to have_selector('#flash_success')
    end
    
    scenario 'with invalid user data' do
      
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      
      visit edit_user_path(user.id)
      
      within('#user_form') do
        fill_in 'user_name', with: ''
        fill_in 'user_email', with: user.email
        fill_in 'user_password', with: user.password
        fill_in 'user_password_confirmation', with: user.password
        fill_in 'user_access_code', with: user.access_code
      end
      click_button 'Update Account'
      expect(current_path).to eql(user_path(user))
      expect(page).to have_selector('#error_messages')
      expect(page).to have_selector('#flash_error')
    end
  
end  