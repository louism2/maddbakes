module Session
  
  def sign_in(user)
    cookies.permanent.signed['head_bitch'] = [user.id, user.salt] 
    self.current_user=(user) 
  end

  def sign_out(user)
  	cookies.delete('head_bitch')
  	self.current_user = nil 
  end

  def current_user=(user)  
    @current_user = user
  end

  def current_user 
    @current_user
  end

  def authenticate_with_salt(id, user_salt_from_cookie)   
    return nil unless id
    user = find(id)
    (user && user.salt == user_salt_from_cookie) ? user : nil   
  end

  def authenticate(email, submitted_password) 
    user = self.where(email: email).first
    return nil if user.nil?
    user.has_password?(submitted_password) ? user : false
  end

  # def signed_in?
  #   !current_user.nil?
  # end

  # def sign_out_link
  #   link_to 'sign out', sign_out_path, {method: :delete}
  # end

  def has_password?(submitted_password) 
    encrypted_password == encrypt(submitted_password) 
  end

private

  def encrypt(pass)
    secure_hash("#{salt} -- #{pass}") 
  end
  
end