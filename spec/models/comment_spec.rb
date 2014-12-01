require 'rails_helper'

describe Comment do
  
  describe 'a valid comment object' do
    comment = FactoryGirl.create(:comment)
    expect(comment).to be_valid
  end
  
  describe 'validations' do
    
  end
  
end  