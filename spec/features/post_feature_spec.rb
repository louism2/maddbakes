require "rails_helper"

feature 'creating a post' do
  
  let(:post){ FactoryGirl.build(:post) }
  let(:user){ FactoryGirl.create(:new_user) }
  
  # scenario 'with valid data' do
  #   mock_object = instance_double('ActionDispatch::Request')
  #   allow(mock_object).to receive(:cookies).and_return([user.id, user.salt] )  
  #   
  # end
  
  
end  