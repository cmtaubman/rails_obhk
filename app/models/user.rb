class User < ActiveRecord::Base
  has_many :bars, through: :bookmarks
end
