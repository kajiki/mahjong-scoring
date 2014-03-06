module Rules
  class HalfFlush < StandardHand
    def self.score() 6 end

    def self.match?(hand)
      super &&
        hand.tiles.select(&:suited?).map(&:type).uniq.count == 1 &&
        hand.tiles.any? { |t| t.honor? }
    end
  end
end
