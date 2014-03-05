module Rules
  class ReversibleTiles < StandardHand
    REVERSIBLE_TILES = [
      Tile.new("2/"),
      Tile.new("4/"),
      Tile.new("5/"),
      Tile.new("6/"),
      Tile.new("8/"),
      Tile.new("9/"),
      Tile.new("1•"),
      Tile.new("2•"),
      Tile.new("3•"),
      Tile.new("4•"),
      Tile.new("5•"),
      Tile.new("8•"),
      Tile.new("9•"),
      Tile.new("白")
    ].freeze

    def self.score() 8 end

    def self.match?(hand)
      super and
      hand.tiles.all? { |tile| REVERSIBLE_TILES.include? tile }
    end
  end
end
