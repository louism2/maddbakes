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
    content "Here is some content for the post Factory.  Here is some more text."
    factory :post_with_photos do
      transient{ photo_count 2 }
      after(:create){ |post, evaluator| create_list(:photo, evaluator.photo_count, post: post) }
    end
  end
  
  factory :photo do
    post
    image_file File.new("#{Rails.root}/spec/fixtures/honda.jpg")
  end
  
  factory :comment do
    content "Here is a comment and some more content...... why not."
    commenter_name "Louie Mancini"
    post_id 1
  end
  
end

  