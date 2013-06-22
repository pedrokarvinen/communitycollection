class Brand < ActiveRecord::Base
  attr_accessible :name, :slug, :about, :created_at, :updated_at
  belongs_to  :user
  has_many :initiatives
  has_many :categories
  has_many :messages
  has_many :tracks
  
  has_many :brands_users
  has_many :users,    :through => :brands_users
end