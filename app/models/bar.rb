class Bar < ActiveRecord::Base
  has_many :users, through: :bookmarks
  serialize :day
  serialize :beverage
end
