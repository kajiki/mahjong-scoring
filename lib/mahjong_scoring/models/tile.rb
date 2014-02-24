class Tile
  SUITS = {
    "/" => :bamboo, 
    "#" => :character, 
    "•" => :circle
  }.freeze

  DRAGONS = {
    "B" => :white_dragon, "白" => :white_dragon,
    "C" => :red_dragon,   "中" => :red_dragon,
    "F" => :green_dragon, "發" => :green_dragon
  }.freeze

  WINDS = {
    "E" => :east_wind,    "東" => :east_wind,
    "S" => :south_wind,   "南" => :south_wind,
    "W" => :west_wind,    "西" => :west_wind,
    "N" => :north_wind,   "北" => :north_wind
  }.freeze

  attr_reader :rank, :type

  def initialize(string)
    if DRAGONS.has_key? string
      @dragon = true
      @type = DRAGONS[string]
    elsif WINDS.has_key? string
      @wind = true
      @type = WINDS[string]
    else
      rank, type = string.chars
      @rank = numerical_rank(rank)
      @type = SUITS[type]
    end
    @string_representation = string
  end

  def terminal?() rank == 1 or rank == 9 end
  def honor?() dragon? or wind? end
  def dragon?() !!@dragon end
  def wind?() !!@wind end

  def to_s() @string_representation end

  def ==(other_tile)
    other_tile.type == self.type && other_tile.rank == self.rank
  end
  alias :eql? :==

  def <=>(other_tile)
    if type != other_tile.type
      type <=> other_tile.type
    else
      rank <=> other_tile.rank
    end
  end

  def +(number)
    Tile.new((rank + number).to_s + to_s[1])
  end

  def hash
    to_s.hash
  end

  private
  def numerical_rank(candidate)
    number = candidate.to_i
    raise ArgumentError.new("Invalid rank: #{candidate}") unless (1..9).include? number
    number
  end
end