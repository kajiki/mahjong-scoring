class TileSet
  attr_reader :tiles

  def initialize(string_or_array)
    if string_or_array.kind_of?(String)
      @tiles = string_or_array.split(/\s+/).map do |string|
        Tile.new(string)
      end
    elsif string_or_array.kind_of?(Array)
      @tiles = string_or_array
    end
  end

  def type
    if pung? then :pung
    elsif kong? then :kong
    elsif chow? then :chow
    end
  end

  private
  def pung?
    tiles.count == 3 and tiles.uniq.count == 1
  end

  def kong?
    tiles.count == 4 and tiles.uniq.count == 1
  end

  def chow?
    sorted = tiles.sort
    sorted == [
      sorted.first, 
      sorted.first + 1, 
      sorted.first + 2
    ]
  end
end