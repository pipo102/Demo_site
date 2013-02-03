module ApplicationHelper
 #standard title 
  def title(title = nil)
    base_title = "Demo_site app"
    if !title
      base_title
    else
      "RoR SAPP | #{@title}"
    end
  end
  #logo part
  def logo
    image_tag("logo.jpg", :alt => "demo project", :class => "round" )
  end
end
