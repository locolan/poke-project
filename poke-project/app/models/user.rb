class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end

class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :email, :password, :password_confirmation, :username
  validates :email, :username, :password, :password_confirmation, presence: true
  validates :email, :uniqueness => true, email: true
  validates :password, length: { minimum: 6 }
  has_many :teams
  has_many :pokemons, :through => :teams
end
