module PhotosHelper
  
  def build_s3_url(id)
    "https://maddbakes.s3.amazonaws.com/photos/#{id}/original.jpg"
  end  
end
