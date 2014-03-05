module Rules
  class LowerFour < StandardHand
    def self.score() 12 end

    def self.match?(hand)
      super and
      hand.tiles.all? { |t| (1..4).cover?(t.rank) }
    end
  end
end
