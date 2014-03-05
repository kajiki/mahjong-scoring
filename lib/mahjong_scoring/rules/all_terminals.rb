module Rules
  class AllTerminals < StandardHand
    def self.score() 64 end

    def self.match?(hand)
      super and
        hand.tiles.all? { |t| t.terminal? }
    end
  end
end
