class Theme < ActiveRecord::Base
  attr_accessible :content
   
   belongs_to :user
   has_many :posts, :dependent => :destroy
   
  validates :content, :presence => true, :length => { :maximum => 140 }
  validates :user_id, :presence => true

    default_scope :order => 'themes.created_at DESC'
end
