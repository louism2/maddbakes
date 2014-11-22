module PasswordEncryption
  
  def encrypt_password  
     self.salt = make_salt 
     self.encrypted_password = encrypt(password)
   end

   def encrypt(pass)
     secure_hash("#{salt} -- #{pass}") 
   end

   def make_salt
     secure_hash("#{Time.now.utc} -- #{password}")
   end

   def secure_hash(string)
     Digest::SHA2.hexdigest(string)
   end

   def has_password?(submitted_password) 
     encrypted_password == encrypt(submitted_password) 
   end
  
end
