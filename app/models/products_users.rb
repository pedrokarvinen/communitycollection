class ProductsUsers < ActiveRecord::Base
  belongs_to :product
  belongs_to :user
  # attr_accessible :title, :body
end
