class Team < ActiveRecord::Base
  attr_accessible :name, :pokemon_id, :user_id, :p1, :p2, :p3, :p4, :p5, :p6
  belongs_to :pokmeon
  belongs_to :user
end
