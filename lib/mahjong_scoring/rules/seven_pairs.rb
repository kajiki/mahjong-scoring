module Rules
  class SevenPairs
    def self.score() 24 end

    def self.match?(hand)
      hand.tiles.count == 14 and hand.pairs.count == 7
    end
  end
end
