class Image < ActiveRecord::Base
  belongs_to :product
  attr_accessible :created_at, :image_path, :thumb_path, :updated_at
end
