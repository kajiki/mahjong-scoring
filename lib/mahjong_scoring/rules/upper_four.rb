module Rules
  class UpperFour < StandardHand
    def self.score() 12 end

    def self.match?(hand)
      super and
      hand.tiles.all? { |t| (6..9).cover?(t.rank) }
    end
  end
end
