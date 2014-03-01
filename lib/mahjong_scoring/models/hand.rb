class Hand
  attr_reader :tilesets

  def initialize(incoming_tilesets)
    @tilesets = incoming_tilesets.map do |tileset|
      TileSet.wrap(tileset)
    end
  end

  def pungs() tilesets.select { |tileset| tileset.type == :pung } end
  def kongs() tilesets.select { |tileset| tileset.type == :kong } end
  def chows() tilesets.select { |tileset| tileset.type == :chow } end
  def pairs() tilesets.select { |tileset| tileset.type == :pair } end
end
