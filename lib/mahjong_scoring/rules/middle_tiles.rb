module Rules
  class MiddleTiles < StandardHand
    def self.score() 24 end

    def self.match?(hand)
      super and
      hand.tiles.all? { |t| (4..6).cover?(t.rank) }
    end
  end
end
