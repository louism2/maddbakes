require 'rails_helper'
#require 'fixtures/test_data'


RSpec.describe PostsHelper, :type => :helper do
  
  describe '#truncate_content' do
    
    context 'when a post is over 500 characters' do
      
      let(:post){ FactoryGirl.build(:post, {content: 'a'*502}) }
    
      it 'an elipses is added' do
        expect(helper.truncate_content(post.content, 3).slice(497,3)).to eq('...')
      end
      
      it 'the total length is cut to 500 characters plus the link length' do
        post_id = 3
        expect(helper.truncate_content(post.content, post_id).length).to eq(500+TestData::post_link_length(post_id))
      end
      
    end
    
    context 'when a post is under 500 characters' do
      
      let(:post){ FactoryGirl.build(:post, {content: 'a'*200}) }
      
      it 'adds the post link on the end of the content preview' do
        post_id = 3
        anchor_tag = TestData::slice_anchor_tag(helper.truncate_content(post.content, post_id))
        expect(anchor_tag).to eq(TestData::post_link(post_id))
      end
    
    end

  end
  
end
