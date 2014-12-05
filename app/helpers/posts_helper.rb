module PostsHelper
  
  def truncate_content(content)
    return content if content.length <= 500
    content.slice(0,497).concat('...')
  end  
  
end
