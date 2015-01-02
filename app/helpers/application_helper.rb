module ApplicationHelper
  
  def list_error_messages(errors_hash)
    html = ''
    errors_hash.each_pair do |attr, messages| 
      attribute = "<h3>#{attr}</h3>"
      errors = build_messages_list(messages)
      html.concat(attribute+errors)
    end
    html.html_safe
  end  
  
  def build_messages_list(messages)
    list_contents = messages.inject(''){|str, message| str.concat("<li>#{message}</li>")}
    "<ul>#{list_contents}</ul>"
  end  
  
  def logo
    "<span id='logo'>MB</span>".html_safe
  end
  
end
