class Post < ActiveRecord::Base
attr_accessible :content
   
   belongs_to :theme
   default_scope :order => 'posts.created_at DESC'
     
  validates :content, :presence => true, :length => { :maximum => 140 }
  validates :theme_id, :presence => true
 
  

end
