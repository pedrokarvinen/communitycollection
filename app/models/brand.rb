class Brand < ActiveRecord::Base
  attr_accessible :name, :slug, :about, :created_at, :updated_at
  has_many :initiatives
end