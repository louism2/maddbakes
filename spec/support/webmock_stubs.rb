module WebmockStubs
  
  def stub_s3_request
    stub_request(:put, /.*amazonaws.*/).to_return(:status => 200)
  end
  
end