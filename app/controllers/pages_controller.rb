class PagesController < ApplicationController
  def home
   @title = "Home"
   @feed_items = Theme.paginate(:page => params[:page])
   if signed_in?
    @theme = Theme.new if signed_in?
    
   end
  end
  def about
   @title = "About"
  end

end
