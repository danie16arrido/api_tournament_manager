class Match < ActiveRecord::Base
  belongs_to :home, :class_name => 'Team'
  belongs_to :away, :class_name => 'Team'
  belongs_to :league
  belongs_to :location
  belongs_to :referee

  has_many :cards
  has_many :homes
  has_many :aways
end
