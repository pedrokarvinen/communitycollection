class Users < ActiveRecord::Base
    
  has_many :products_users
  has_many :products,      :through => :products_users 
  
  has_many :messages_users
  has_many :messages, :through => :messages_users
  
  has_many :tracks
  
  attr_accessible :auth_hash, :created_at, :email, :facebook_auth_id, :is_active, :is_deleted, :password, :twitter_auth_id, :kind, :updated_at
end
