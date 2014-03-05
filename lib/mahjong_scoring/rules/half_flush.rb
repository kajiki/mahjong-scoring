module Rules
  class HalfFlush < StandardHand
    def self.score() 6 end

    def self.match?(hand)
      super and (
        (
          hand.tiles.all? { |t| t.type == :bamboo or t.honor? } and
          hand.tiles.any? { |t| t.type == :bamboo } and
          hand.tiles.any? { |t| t.honor? }
        ) or
        (
          hand.tiles.all? { |t| t.type == :circle or t.honor? } and
          hand.tiles.any? { |t| t.type == :circle } and
          hand.tiles.any? { |t| t.honor? }
        ) or
        (
          hand.tiles.all? { |t| t.type == :character or t.honor? } and
          hand.tiles.any? { |t| t.type == :character } and
          hand.tiles.any? { |t| t.honor? }
        )
      )
    end
  end
end
