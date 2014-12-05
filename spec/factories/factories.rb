FactoryGirl.define do
  
  factory :user do
    name 'Louis Mancini'
    email 'louiscmancini@gmail.com' 
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
    content "Here is some content for the post Factory.  Here is some more text."*8
    title "An awesome post about cake!"
    factory :post_with_photos do
      transient{ photo_count 2 }
      after(:create) do |post, evaluator| 
        create_list(:photo, evaluator.photo_count, post: post)
      end  
    end
    factory :post_with_photos_and_comments do
      after(:create) do |post, evaluator|
        create_list(:photo, 2, post: post)
        create_list(:comment, 2, post: post)
      end
    end  
  end
  
  factory :photo do
    post
    image_file File.new("#{Rails.root}/spec/fixtures/honda.jpg")
  end
  
  factory :comment do
    post
    content "Here is a comment and some more content...... why not."
    commenter_name "Louie Mancini"
  end
  
end

  