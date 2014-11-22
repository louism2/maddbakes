FactoryGirl.define do
  
  factory :user do
    name 'Maddie Lucas'
    email 'louism2@u.washington.edu'
    factory :persisted_user do
      salt 'fdadau8pgauagud90agdadgda9ufdua9f0dutda68ftda'
      encrypted_password 'fajkl3214htuyv8a932qcr3u90fewau90'
    end
    factory :new_user do
      password 'Testing123'
      password_confirmation 'Testing123'
      access_code 'two d\'s one word'
    end
  end
  
  factory :post do
    comment "Here is a comment for the post Factory.  Here is some more text."
    author "Louie Mancini"
  end
  
  factory :photo do
    image_file File.new('/Users/louism2/rails_projects/queenie/spec/testing_utilities/honda.jpg')
  end
  
end

  