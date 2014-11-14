require 'rails_helper'

describe PasswordEncryption do
  
  describe '#encrypt_password' do
    
    before(:each) do
      class Klass
        include PasswordEncryption
        attr_accessor :salt, :encrypted_password, :password
      end
    end
    
    let(:obj) do
      obj = Klass.new 
      obj.password = 'test'
      obj
    end
    
    it  'sets the @salt variable' do
      obj.encrypt_password
      expect(obj.salt).not_to be_nil
    end
    
    it  'sets the @encrypted_password variable' do
      obj.encrypt_password
      expect(obj.encrypted_password).not_to be_nil
    end
    
  end

end