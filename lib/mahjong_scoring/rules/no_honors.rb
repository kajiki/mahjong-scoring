module Rules
  class NoHonors < StandardHand
    def self.score() 1 end

    def self.match?(hand)
      super and
        hand.tiles.none? { |t| t.honor? }
    end
  end
end
