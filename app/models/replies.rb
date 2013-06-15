class Replies < ActiveRecord::Base
  belongs_to :message
  attr_accessible :content, :created_at, :is_deleted, :is_read
end
