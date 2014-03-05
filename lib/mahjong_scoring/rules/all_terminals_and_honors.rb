module Rules
  class AllTerminalsAndHonors < StandardHand
    def self.score() 32 end

    def self.match?(hand)
      super and
        hand.tiles.all? { |t| t.honor? or t.terminal? } and
        hand.tiles.any? { |t| t.honor? } and
        hand.tiles.any? { |t| t.terminal? }
    end
  end
end
