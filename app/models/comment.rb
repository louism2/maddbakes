class Comment < ActiveRecord::Base
  
  belongs_to :post
  
  validates :content,         length: {minimum: 2, maximum: 500}
  
  validates :commenter_name,  length: {minimum: 2, maximum: 40}
  
  validates :post_id,         presence: true,
                              numericality: true
  
end
