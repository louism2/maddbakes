describe Post do
  
  describe 'factory' do
    
    it 'should produce and valid object' do
      post = FactoryGirl.create(:post)
      expect(post).to be_valid
    end
    
  end
  
  describe 'validations' do
    
    let(:post){ FactoryGirl.build(:post)  }
    
    describe 'content' do
      it 'can\'t be blank' do
        post.content = ''
        expect(post).not_to be_valid
      end
      
      it 'can\'t be more than 300 characters' do
        post.content = 'a'*301
        expect(post).not_to be_valid
      end
    end
    
  end  
  
  describe 'associations' do
    it 'responds to :photos' do
      post = Post.reflect_on_association(:photos)
      expect(post.macro).to eql(:has_many)
    end
  end
  
  describe 'validates_assciated' do
    describe ':photos' do
      it 'is validated when a save is called' do
       
      end 
    end
  end
  
end