class Category < ActiveRecord::Base
  belongs_to :brand
  has_and_belongs_to_many :product
  attr_accessible :cat_id, :created_at, :genre, :name, :parent_id, :kind, :updated_at
end
