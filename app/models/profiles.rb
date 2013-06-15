class Profiles < ActiveRecord::Base
  belongs_to :user,         :as => :userdatail
  attr_accessible :address1, :address2, :avatar, :city, :country, :created_at, :first_name, :gendre, :last_name, :state, :updated_at, :zipcode
end
