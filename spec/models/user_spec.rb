require 'rails_helper'

describe User do

  describe 'factory' do
    
    context 'new user' do
      it 'should produce a valid object' do
        user = FactoryGirl.build(:new_user)
        expect(user).to be_valid     
      end      
    end
    
    context 'a saved user' do
      it 'should produce a valid object' do
        user = FactoryGirl.build_stubbed(:persisted_user)
        expect(user).to be_valid
      end      
    end
    
  end
  
  describe 'validations' do
      
    let(:user){ FactoryGirl.build(:new_user) }
    
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
      
      let(:persisted_user){ FactoryGirl.build_stubbed(:persisted_user) }
      let(:short_password){ 'Short12' }
      let(:no_capital_password){ 'testing123' }
      let(:no_digit_password){ 'Testing' }
      
      context 'updating a user' do
        
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
      
      it 'must be unique' do
        u = FactoryGirl.build(:new_user)
        u.save
        duplicate_user = FactoryGirl.build(:new_user)
        duplicate_user.valid?
        expect(duplicate_user.errors[:email]).not_to be_blank
      end          
      
    end
  
  end
  
  describe 'callbacks' do
  
    let(:new_user){ FactoryGirl.build(:new_user) }
    
    describe '#encrypt_password' do
      
      context 'creating a user' do
        
        it 'should be on validation' do
          expect(new_user).to receive(:encrypt_password)
          new_user.save
        end
        
      end
      
      context 'updating a user' do
        
        before(:each) do 
          new_user.save
        end
        
        it 'should not call #encrypt_password if password field is empty' do
          new_user.password = ''
          expect(new_user).not_to receive(:encrypt_password)
          new_user.save
        end
        
        it 'should call encrypt password if password has a value' do
          
        end
      end
      
    end
  
  
  end

end