class Messages < ActiveRecord::Base
  belongs_to :brand
 
  has_many :messages_users
  has_many  :users, :through => :messages_users
  
  has_many :attaches
  
  has_many :replies
  
  attr_accessible :content, :created_at, :is_deleted, :subject
end
