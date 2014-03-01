class TileSet
  attr_reader :tiles

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
    end
  end

  private
  def pair?
    tiles.count == 2 and tiles.uniq.count == 1
  end

  def pung?
    tiles.count == 3 and tiles.uniq.count == 1
  end

  def kong?
    tiles.count == 4 and tiles.uniq.count == 1
  end

  def chow?
    tiles == [
      tiles.first, 
      tiles.first + 1, 
      tiles.first + 2
    ]
  end

  def tiles_from_string(string)
    string.split(/\s+/).map do |tile|
      Tile.new(tile)
    end
  end
end