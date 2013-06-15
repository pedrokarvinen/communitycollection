class MessagesUsers < ActiveRecord::Base
  belongs_to :message
  belongs_to :user
  attr_accessible :created_at, :is_deleted, :is_read
end
