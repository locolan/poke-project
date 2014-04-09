class TeamsController < ApplicationController
  def index
    @pokemon = Pokemon.all
  end
end
