class Initiative < ActiveRecord::Base
  belongs_to :brand
  attr_accessible :about, :created_at, :name, :slug, :splash, :thumbnail, :updated_at
  has_many :articles
end
