class Post < ActiveRecord::Base
attr_accessible :content
   
   belongs_to :theme
   belongs_to :user
   default_scope :order => 'posts.created_at ASC'
     
  validates :content, :presence => true, :length => { :maximum => 140 }
  validates :theme_id, :presence => true
 validates :user_id, :presence => true
  

end
