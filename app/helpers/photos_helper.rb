module PhotosHelper
  
  def build_s3_url(id)
    "https://maddbakes.s3.amazonaws.com/photos/#{id}/original.jpg"
  end  
  
  def opening_form_tag_for_photos
    "<form action='/photos/update_images' />".html_safe
  end 
  
  def closing_form_tag_and_submit_button
    "<button type='submit' />Update Photos</button></form>".html_safe
  end  
  
end
