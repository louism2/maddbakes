#require 'rails_helper'

describe Comment do
  
  describe 'a valid comment object' do
    it 'should create a valid object' do
      comment = FactoryGirl.create(:comment)
      expect(comment).to be_valid
    end
  end
  
  describe 'validations' do
    
    let(:post){ FactoryGirl.build(:post)}
    
    describe 'content' do
      it 'has a max length of 500 characters' do
        post.content = 'a'*500
        post.valid?
        expect(post.errors['content']).not_to be_empty
      end  
      
      it 'must have at least two characters' do
        post.content = 'a'
        post.valid?
        expect(post.errors['content']).not_to be_empty
      end
    end
    
    describe 'commenter_name' do
      it 'has a max length of 40 characters' do
        post.commenter_name = 'a'*41
        post.valid?
        expect(post.errors['commenter_name']).not_to be_empty
      end
    end
    
    describe 'post_id' do
      it 'must be a number' do
        post.post_id = 'aa'
        post.valid?
        expect(post.errors['post_id']).not_to be_empty
      end
    end
    
  end
  
end  