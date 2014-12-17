module AuthenticateTestUser
  
  def set_current_user(user)
    visit sign_in_path
    
    within('#sessions_form') do
      fill_in 'email', with: user.email
      fill_in 'password', with: user.password
    end
    
    click_button 'Sign In'
  end  
  
end