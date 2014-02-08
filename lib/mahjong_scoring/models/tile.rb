class Tile
  SUITS = {
    "/" => :bamboo, 
    "#" => :character, 
    "•" => :circle
  }.freeze

  HONORS = {
    "B" => :white_dragon, "白" => :white_dragon,
    "C" => :red_dragon,   "中" => :red_dragon,
    "F" => :green_dragon, "發" => :green_dragon,
    "E" => :east_wind,    "東" => :east_wind,
    "S" => :south_wind,   "南" => :south_wind,
    "W" => :west_wind,    "西" => :west_wind,
    "N" => :north_wind,   "北" => :north_wind
  }

  attr_reader :rank, :type

  def initialize(string)
    if HONORS.has_key? string
      @type = HONORS[string]
    else
      rank, type = string.chars
      @rank = numerical_rank(rank)
      @type = SUITS[type]
    end
  end

  private
  def numerical_rank(candidate)
    number = candidate.to_i
    raise ArgumentError.new("Invalid rank: #{candidate}") unless (1..9).include? number
    number
  end
end