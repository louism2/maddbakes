require "rails_helper"

feature 'signing in a user' do
  
  let(:user){ FactoryGirl.create(:new_user) }

  scenario 'with valid user data' do
    visit '/sessions/new'
    
    within('#sessions_form') do
      fill_in 'email', with: user.email
      fill_in 'password', with: user.password
      click_button 'Sign In'
    end
    
    expect(current_path).to eq('/')
  end
  
  scenario 'with invalid user data' do
    visit '/sessions/new'
    
    within('#sessions_form') do
      fill_in 'email', with: 'invalid@email.com'
      fill_in 'password', with: 'invalidpassword'
      click_button 'Sign In'
    end
  
    expect(current_path).to eq('/sessions')
  
  end
    
  
end

  