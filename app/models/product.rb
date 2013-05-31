class Product < ActiveRecord::Base
  belongs_to :brand
  has_and_belongs_to_many :category
  attr_accessible :color, :description, :name, :price, :prod_id, :genre
end
