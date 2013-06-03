class Product < ActiveRecord::Base
  belongs_to :brand
  has_many :images
  has_and_belongs_to_many :categories
  attr_accessible :color, :description, :name, :price, :prod_id, :genre
end
