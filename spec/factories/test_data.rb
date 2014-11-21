class TestData
  
  def self.create_user_cookie(user, request)
    jar = ActionDispatch::Cookies::CookieJar.build(request)
    jar.signed[:head_bitch] = [user.id, user.salt]
    request.cookies['head_bitch'] = jar[:head_bitch]
  end
  
end