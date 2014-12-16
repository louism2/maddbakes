require 'rails_helper'

describe SessionsController do

  describe '#create' do
    
    context 'a valid email and password' do
      
      let(:user){ FactoryGirl.create(:new_user) }
      
      it 'sets the session cookie' do
        post :create, session: {email: user.email, password: user.password}
        expect(@response.cookies[:head_bitch]).not_to be_nil
      end    
    
      it 'redirects to the homepage' do 
        post :create, session: {email: user.email, password: user.password}
        expect(@response).to redirect_to(root_path)
      end 
      
    end
    
  end

end
