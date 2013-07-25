class PlayerController < ApplicationController
  def index
    @players = Player.fetch
  end
end
