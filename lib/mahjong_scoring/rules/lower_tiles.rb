module Rules
  class LowerTiles < StandardHand
    def self.score() 24 end

    def self.match?(hand)
      super and
      hand.tiles.all? { |t| (1..3).cover?(t.rank) }
    end
  end
end
