class BrandsUsers < ActiveRecord::Base
  belongs_to :user
  belongs_to :brand
  # attr_accessible :title, :body
end
