module Session

  def signed_in?
    !current_user.nil?
  end

  def sign_out  
  	cookies.delete(:remember_token)
  	self.current_user = nil 
  end

  def current_user=(user)  
    @current_user = user
  end

  def current_user 
    @current_user ||= user_from_remember_token 
  end
  
private
  
  def remember_token
    cookies.signed[:head_bitch] || [nil, nil]
  end

  def user_from_remember_token
    authenticate_with_cookie(*remember_token) 
  end
  
  def authenticate_with_cookie(id, user_salt_from_cookie) 
    user = User.find(id)
    (user && user.salt == user_salt_from_cookie) ? user : nil   
  end
  
  def authenticate_with_email_and_password(email, submitted_password) 
    user = User.where({email: email}).first
    return nil if user.nil?
    return user if user.has_password?(submitted_password)  
  end
  
  def has_password?(submitted_password) 
    encrypted_password == encrypt(submitted_password) 
  end
  
end