module Rules
  class AllGreen < StandardHand
    GREEN_TILES = [
      Tile.new("2/"),
      Tile.new("3/"),
      Tile.new("4/"),
      Tile.new("6/"),
      Tile.new("8/"),
      Tile.new("發")
    ].freeze

    def self.score() 88 end

    def self.match?(hand)
      super and hand.tiles.all? { |tile| GREEN_TILES.include? tile }
    end
  end
end
