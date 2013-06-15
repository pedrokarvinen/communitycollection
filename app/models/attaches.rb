class Attaches < ActiveRecord::Base
  belongs_to :message
  attr_accessible :created_at, :file_path, :type
end
