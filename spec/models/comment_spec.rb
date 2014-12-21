#require 'rails_helper'

describe Comment do
  
  describe 'comment factory' do
    it 'should create a valid object' do
      comment = FactoryGirl.create(:comment)
      expect(comment).to be_valid
    end
  end
  
  describe 'callbacks' do
    
    let(:comment){ FactoryGirl.build(:comment) }
    
    describe 'before_save callback fails' do
      it 'does not call any callbacks after the one the returns false' do
        expect(comment).to receive(:first_call)
        allow(comment).to receive(:second_call).and_return(false)
        expect(comment).not_to receive(:third_call)
        comment.save
      end
      
      it 'does not call any of the after_save callbacks' do
        expect(comment).not_to receive(:after_first)
        exppect(comment).not_to receive(:after_second)
        comment.save
      end
    end
    
  end
  
  describe 'validations' do
    
    let(:comment){ FactoryGirl.build(:comment)}
    
    describe '@content' do
      it 'has a max length of 500 characters' do
        comment.content = 'a'*501
        comment.valid?
        expect(comment.errors['content']).not_to be_empty
      end  

      it 'must have at least 2 characters' do
        comment.content = 'a'
        comment.valid?
        expect(comment.errors['content']).not_to be_empty
      end
    end

    describe '@commenter_name' do
      it 'has a max length of 40 characters' do
        comment.commenter_name = 'a'*41
        comment.valid?
        expect(comment.errors['commenter_name']).not_to be_empty
      end
      
      it 'must have at least 2 characters' do
        comment.commenter_name = 'a'
        comment.valid?
        expect(comment.errors['commenter_name']).not_to be_empty
      end
    end

    describe '@post_id' do
      it 'must be a number' do
        comment.post_id = 'aa'
        comment.valid?
        expect(comment.errors['post_id']).not_to be_empty
      end
    end

  end
  
end  