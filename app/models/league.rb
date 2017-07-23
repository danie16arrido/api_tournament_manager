class League < ActiveRecord::Base
  has_many :teams
  has_many :locations
  has_many :referees
  has_many :matches
end
