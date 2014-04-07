class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :password_digest, :username
  has_many :teams
  has_many :pokemons, :through => :teams
end
