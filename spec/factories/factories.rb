FactoryGirl.define do
  
  factory :user do
    name 'Maddie Lucas'
    password 'Testing123'
    password_confirmation 'Testing123'
    email 'louism2@u.washington.edu'
  end
  
  factory :photo do
    image_file File.new('/Users/louism2/rails_projects/queenie/spec/testing_utilities/honda.jpg')
  end
  
end

  