class Tracks < ActiveRecord::Base
  belongs_to :user
  belongs_to :brand
  attr_accessible :ip_address, :page_url, :visited_at
end
