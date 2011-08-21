module ApplicationHelper

  # Return a title on a per-page basis.
  def title()
    base_title = "Ruby on Rails Tutorial Sample App"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  def logo()
    image_tag("logo_black.png", :alt => "Sample App",
      :width => "60", :height => "51")
  end
  
  def logoText()
    image_tag("parwinr.png", :alt => "ParWinr",
      :height => "40")
  end

end
