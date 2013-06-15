class Product < ActiveRecord::Base
  belongs_to :brand
  has_many :images
  has_and_belongs_to_many :categories
  has_many  :products_users
  has_many  :users, :through => :products_users
  attr_accessible :color, :description, :name, :price, :prod_id, :genre
end
