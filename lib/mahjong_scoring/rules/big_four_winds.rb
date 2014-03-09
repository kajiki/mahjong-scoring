module Rules
  class BigFourWinds < StandardHand
    def self.score() 88 end

    def self.match?(hand)
      super and
      (hand.pungs + hand.kongs).select(&:wind?).count == 4
    end
  end
end
