require 'rails_helper'

describe User do

  describe 'factory' do
    it 'should produce a valid object' do
      user = FactoryGirl.build(:user)
      expect(user.valid?).to be true
    end
  end
  
  describe 'validations' do
      
    let(:user){ FactoryGirl.build(:user) }
    
    describe '@name' do
      
      let(:long_name){ 'a'*51 }
      let(:numeric_name){ '123abc456'}
      
      it 'must be 50 characters or less' do
        user.name = long_name
        user.valid?
        expect(user.errors[:name]).not_to be_empty
      end
      
      it 'must be present' do
        user.name = ''
        user.valid?
        expect(user.errors[:name]).not_to be_empty
      end
      
      it 'must contain only letters' do
        user.name = numeric_name
        user.valid?
        expect(user.errors[:name]).not_to be_empty
      end
      
    end 
    
    describe '@password' do
      
      let(:persisted_user){ FactoryGirl.create(:user) }
      let(:short_password){ 'Short12' }
      let(:no_capital_password){ 'testing123' }
      let(:no_digit_password){ 'Testing' }
      
      context 'when user is persisted' do
        
        it 'a blank string is not validated' do
          persisted_user.password = ''
          expect(persisted_user).to be_valid
        end
        
      end
      
      it 'must be at least 8 characters' do
        user.password = short_password
        user.password_confirmation = short_password
        expect(user).not_to be_valid
        expect(user.errors[:password]).not_to be_blank
      end
      
      it 'contains a numeric character' do
        user.password = no_digit_password
        user.password_confirmation = no_digit_password
        expect(user).not_to be_valid
        expect(user.errors[:password]).not_to be_blank
      end
      
      it 'contains a capital letter' do
        user.password = no_capital_password
        user.password_confirmation = no_capital_password
        expect(user).not_to be_valid
        expect(user.errors[:password]).not_to be_blank
      end
      
    end
    
    describe '@email' do
      
      let(:no_at_email){ 'louiscmancinigmail.com' }
      let(:no_domain_email){ 'louiscmancini@gmail.' }
      let(:no_dot_email){ 'louiscmancini@gmailcom' }        
      
      it 'must not be blank' do
        user.email = ''
        expect(user).not_to be_valid
        expect(user.errors[:email]).not_to be_blank       
      end
      
      it 'must have @ sign' do
        user.email = no_at_email
        expect(user).not_to be_valid
        expect(user.errors[:email]).not_to be_blank
      end    
      
      it 'must have domain' do
        user.email = no_domain_email
        expect(user).not_to be_valid
        expect(user.errors[:email]).not_to be_blank
      end
  
      it 'must have . before domain' do
        user.email = no_dot_email
        expect(user).not_to be_valid
        expect(user.errors[:email]).not_to be_blank
      end            
      
    end
  
  end

end