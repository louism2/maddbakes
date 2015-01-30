module PhotosHelper
  
  def build_s3_url(id)
    "https://maddbakes.s3.amazonaws.com/photos/#{id}/original.jpg"
  end  
  
  def image_alteration_banner
    "<p align='center' id='image_alteration_banner'>You have changes pending.  Click the button below to submit your changes<br><button id='confirm_photo_changes_button'>Confirm Changes</button></p>".html_safe
  end  
  
end
