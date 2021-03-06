module PostsHelper
  
  def truncate_content(content, id)
    if content.length <= 500
      content.concat('\n'+build_post_link(id)).html_safe
    else
      content.slice(0,497).concat('...').concat(build_post_link(id)).html_safe  
    end  
    
  end  
  
  def display_photos(photos)
    if photos.any?
      photos.each{|photo| render partial: 'photos/thumbnail', object: photo }
    else
      "No photos to display"
    end    
  end
  
  def build_post_title_link(post)
    "<h2 class='title_wrapper'>#{link_to post.title, post, class: 'post_title'}#{format_date(post.created_at)}</h2>".html_safe
  end  
  
  def build_post_title(post)
    "<h2 class='title_wrapper' id='post_header'><span class='post_title'>#{post.title}</span>#{format_date(post.created_at)}</h2>#{link_to 'delete post?', post_path(post), {method: 'delete', id: 'destroy_post'} if signed_in?}".html_safe    
  end
  
  def format_date(datetime)
    datetime.strftime('%a %d %b %Y').to_s
  end
  
  def display_header_photo(post)
    return unless post.header_photo
    "<div class='header_photo_wrapper'>#{image_tag build_s3_url(post.header_photo.id), alt: 'header photo', class: 'header_photo'}</div>".html_safe
  end  
  
private

  def build_post_link(id)
    link_to 'read more', post_path(id)
  end    
  
end
