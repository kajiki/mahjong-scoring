module Rules
  class FullFlush < StandardHand
    def self.score() 24 end

    def self.match?(hand)
      super and
      (
        hand.tiles.all? { |t| t.type == :bamboo } or
        hand.tiles.all? { |t| t.type == :circle } or
        hand.tiles.all? { |t| t.type == :character }
      )
    end
  end
end
