module Session

  def signed_in?
    !current_user.nil?
  end
  
  def sign_in(user)
    cookies.permanent.signed[:head_bitch] = [user.id, user.salt] 
    self.current_user=(user) 
  end

  def sign_out  
  	cookies.delete(:head_bitch)
  	self.current_user=(nil)
  end

  def current_user=(user)  
    @current_user = user
  end

  def current_user 
    @current_user ||= user_from_remember_token 
  end
  
private
  
  def user_from_remember_token
    authenticate_with_cookie(*remember_token) 
  end
  
  def remember_token
    cookies.signed[:head_bitch] || [nil, nil]
  end
  
  def authenticate_with_cookie(id, user_salt_from_cookie) 
    user = User.find_by_id(id)
    (user && user.salt == user_salt_from_cookie) ? user : nil   
  end
  
  def authenticate_with_email_and_password(email, submitted_password) 
    user = User.find_by_email(email)
    return nil if user.nil?
    user.has_password?(submitted_password)
  end
  
  def has_password?(submitted_password) 
    encrypted_password == encrypt(submitted_password) 
  end
  
end