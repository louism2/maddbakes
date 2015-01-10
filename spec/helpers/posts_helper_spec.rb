require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the PostsHelper. For example:
#
# describe PostsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe PostsHelper, :type => :helper do
  
  describe '#truncate_content' do
    
    let(:post){ FactoryGirl.build(:post, {content: 'a'*501}) }
    
    it 'adds an elipses' do
      expect(helper.truncate_content(post).slice(497,3)).to eq('...')
    end
  end
  
end
