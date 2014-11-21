require "rails_helper"

feature 'creating a user' do
  
  let(:user){ FactoryGirl.create(:user) }
  
  scenario 'with valid user data' do
    visit '/users/new'
    within('#new_user_form') do
      fill_in 'Name', with: user.name
      fill_in 'Email', with: user.email
      fill_in 'password', with: user.password
      fill_in 'password_confirmation', with: user.password
      fill_in 'access_code', with: "two d's one word"
    end
    expect{
      click_button 'submit'
    }.to change(User, :count).by(1)
  end

end