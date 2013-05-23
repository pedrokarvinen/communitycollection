class Article < ActiveRecord::Base
  belongs_to :initiative
  attr_accessible :body, :created_at, :slug, :splash, :thumbnail, :title, :updated_at
end
