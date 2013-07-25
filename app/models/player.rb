class Player

  attr_accessor "first_name"
  attr_accessor "last_name"
  attr_accessor "hits"
  attr_accessor "home_runs"
  attr_accessor "rbi"
  attr_accessor "runs"
  attr_accessor "steals"
  attr_accessor "at_bats"

  require 'nokogiri'
  require 'open-uri'

  def Player.fetch
    url = "http://www.cafeconleche.org/examples/baseball/1998statistics"
    xml = Nokogiri::XML(open(url))
    players_api_list = xml.search('PLAYER').map do |player|
      %w[GIVEN_NAME SURNAME HITS HOME_RUNS RBI RUNS STEALS AT_BATS].each_with_object({}) do |n, o|
        o[n] = player.at(n)
      end
    end

    players = Array.new

    players_api_list.each do |player_hash|
      player = Player.new
      player.first_name = player_hash["GIVEN_NAME"]
      player.last_name = player_hash["SURNAME"]
      player.hits = player_hash["HITS"]
      player.home_runs = player_hash["HOME_RUNS"]
      player.rbi = player_hash["RBI"]
      player.runs = player_hash["RUNS"]
      player.steals = player_hash["STEALS"]
      player.at_bats = player_hash["AT_BATS"]

      players.push player
    end
    return players
  end

  def average
  end

end
