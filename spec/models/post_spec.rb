require_relative '../fixtures/test_data'

describe Post do
  
  describe 'factory' do
    
    it 'should produce and valid object' do
      post = FactoryGirl.create(:post)
      expect(post).to be_valid
    end
    
  end
  
  describe 'validations' do
    
    let(:post){ FactoryGirl.build(:post)  }
    
    describe '@content' do
      it 'can\'t be blank' do
        post.content = ''
        expect(post).not_to be_valid
      end
      
      it 'can\'t be more than 3000 characters' do
        post.content = 'a'*3001
        expect(post).not_to be_valid
      end
    end
    
  end  
  
  describe 'associations' do
    it 'responds to :photos' do
      post = Post.reflect_on_association(:photos)
      expect(post.macro).to eql(:has_many)
    end
    
    it 'responds to :comments' do
      post = Post.reflect_on_association(:comments)
      expect(post.macro).to eql(:has_many)
    end
  end
  
  describe 'validates_assciated' do
    describe ':photos' do
      
      after(:each) do
        FileUtils.remove_dir("#{Rails.root}/public/system",true)
      end
      
      it 'is validated when a save is called' do
        post = Post.new(TestData::POST_WITH_INVALID_PHOTO_PARAMS)
        post.valid?
        expect(post.errors['photos']).not_to be_empty
      end 
    end
  end
  
end