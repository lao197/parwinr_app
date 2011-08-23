class PagesController < ApplicationController
  def home
    @title = "Home"
    if signed_in?
    
    end
  end

  def contact
    @title = "Contact"
  end

  def about
    @title = "About"
  end
  
  def help
    @title = "Help"
  end
  
  def search
    @title = "Search"
    @search = params[:q]
  end
end
