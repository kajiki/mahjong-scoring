module Rules
  class AllTypes < StandardHand
    def self.score() 16 end

    def self.match?(hand)
      super and
        hand.tiles.any? { |t| t.type == :bamboo } and
        hand.tiles.any? { |t| t.type == :character } and
        hand.tiles.any? { |t| t.type == :circle } and
        hand.tiles.any? { |t| t.dragon? } and
        hand.tiles.any? { |t| t.wind? }
    end
  end
end
