module Rules
  class UpperTiles < StandardHand
    def self.score() 24 end

    def self.match?(hand)
      super and
      hand.tiles.all? { |t| (7..9).cover?(t.rank) }
    end
  end
end
