module ApplicationHelper
  
  def active_class(link_path)
    request.fullpath.starts_with?(link_path) ? "active" : ""
  end

end
