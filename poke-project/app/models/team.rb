class Team < ActiveRecord::Base
  attr_accessible :name, :pokemon_id, :user_id
  belongs_to :pokmeon
  belongs_to :user
end
