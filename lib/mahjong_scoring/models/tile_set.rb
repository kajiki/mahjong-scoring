class TileSet

  KNITTED_SETS = [
        [1, 4, 7],
        [2, 5, 8],
        [3, 6, 9]
      ].freeze

  attr_reader :tiles

  def self.wrap(object)
    if object.kind_of?(TileSet)
      object
    else
      new(object)
    end
  end

  def initialize(string_or_array)
    if string_or_array.kind_of?(String)
      @tiles = tiles_from_string(string_or_array).sort
    elsif string_or_array.kind_of?(Array)
      @tiles = string_or_array.sort
    end
  end

  def type
    if pair? then :pair
    elsif pung? then :pung
    elsif kong? then :kong
    elsif chow? then :chow
    elsif knitted? then :knitted
    end
  end

  def tile_type
    tiles.first.type if (pair? or pung? or kong? or chow? or knitted?)
  end

  def rank
    tiles.first.rank if (pair? or pung? or kong? or chow? or knitted?)
  end

  def dragon?
    tiles.first.dragon?
  end

  def wind?
    tiles.first.wind?
  end

  def suited?
    tiles.first.suited?
  end

  def ==(other_tileset)
    tiles == other_tileset.tiles
  end

  def inspect
    "#<#{self.class.name}: #{tiles.map(&:to_s).join(" ")}>"
  end

  private
  def pair?
    tiles.count == 2 and same_value?
  end

  def pung?
    tiles.count == 3 and same_value?
  end

  def kong?
    tiles.count == 4 and same_value?
  end

  def chow?
    tiles == [
      tiles.first, 
      tiles.first + 1, 
      tiles.first + 2
    ]
  end

  def knitted?
    single_type? and suited? and
    KNITTED_SETS.include? tiles.map(&:rank)
  end

  def tiles_from_string(string)
    string.split(/\s+/).map do |tile|
      Tile.new(tile)
    end
  end

  def single_type?
    tiles.map(&:type).uniq.count == 1
  end

  def same_value?
    tiles.uniq.count == 1
  end
end
