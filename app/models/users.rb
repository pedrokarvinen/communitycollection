class Users < ActiveRecord::Base
  belongs_to :userdetail, :polymorphic => true
  
  has_many :products_users
  has_many :products,      :through => :products_users 
  
  has_many :messages_users
  has_many :messages, :through => :messages_users
  
  has_many :tracks
  
  attr_accessible :auth_hash, :create_at, :email, :facebook_auth_id, :is_active, :is_deleted, :password, :twitter_auth_id, :type, :updated_at
end
