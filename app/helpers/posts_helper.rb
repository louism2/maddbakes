module PostsHelper
  
  def truncate_content(content)
    return content if content.length <= 500
    content.slice(0,497).concat('...')
  end  
  
  def display_post(photos)
    if photos.any?
      render partial: 'photos/thumbnails', object: photos
    else
      "No photos to display"
    end    
  end
  
end
