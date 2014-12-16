module AuthenticateUser
  
  def set_current_user(user)
    visit new_session_path
    
    within('#session_form') do
      fill_in '#email', with: user.email
      fill '#password', with: user.password
    end
    
    click_button 'Sign In'
  end  
  
end