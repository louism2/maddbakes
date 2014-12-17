require 'rails_helper'

describe SessionsController do

  describe '#create' do
    
    context 'a valid email and password' do
      
      let(:user){ FactoryGirl.create(:new_user) }
      
      it 'sets the session cookie' do
        post :create, {email: user.email, password: user.password}
        expect(@response.cookies["head_bitch"]).not_to be_nil
      end    
    
      it 'redirects to the homepage' do 
        post :create, {email: user.email, password: user.password}
        expect(@response).to redirect_to(root_path)
      end 
      
    end
    
    context 'an invalid email and password' do
    
      it 'renders the "new" template' do
        post :create, {email: 'bad_email', password: 'bad_password'}
        expect(response).to render_template(:new)
      end
      
    end
    
  end

end
