module Rules
  class LittleFourWinds < StandardHand
    def self.score() 64 end

    def self.match?(hand)
      super and
      (hand.pungs + hand.kongs).select(&:wind?).count == 3 and
      hand.pairs.select(&:wind?).count == 1
    end
  end
end
