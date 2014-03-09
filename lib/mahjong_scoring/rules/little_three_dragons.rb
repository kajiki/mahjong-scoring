module Rules
  class LittleThreeDragons < StandardHand
    def self.score() 64 end

    def self.match?(hand)
      super and
      (hand.pungs + hand.kongs).select(&:dragon?).count == 2 and
      hand.pairs.select(&:dragon?).count == 1
    end
  end
end
