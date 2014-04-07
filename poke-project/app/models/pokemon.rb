class Pokemon < ActiveRecord::Base
  attr_accessible :name, :pokeAPI_id, :type
  has_many :teams
  has_many :users, :through => :teams
end
