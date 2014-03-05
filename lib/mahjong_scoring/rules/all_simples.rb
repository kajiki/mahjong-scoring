module Rules
  class AllSimples < StandardHand
    def self.score() 2 end

    def self.match?(hand)
      super and
        hand.tiles.none? { |t| t.honor? } and
        hand.tiles.none? { |t| t.terminal? }
    end
  end
end
