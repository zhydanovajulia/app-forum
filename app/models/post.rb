class Post < ActiveRecord::Base
attr_accessible :content
   
   belongs_to :theme
   default_scope :order => 'posts.created_at DESC'
   
  def index
    @title = "Posts"
  #  @posts = Theme.paginate(:page => params[:page])
  end

end
