class Post < ActiveRecord::Base
attr_accessible :content, :picture
   
   belongs_to :theme
   belongs_to :user
   default_scope :order => 'posts.created_at ASC'
     
  validates :content, :presence => true, :length => { :maximum => 140 }
  validates :theme_id, :presence => true
 validates :user_id, :presence => true
 
    has_attached_file :picture, 
                      :url  => "/assets/:id/:style/:basename.:extension",
                      :path => ":rails_root/public/assets/:id/:style/:basename.:extension",
                    #  :default_url => '/assets/rails.png',
                    
    :styles => { :medium => "400x300>" }

end
