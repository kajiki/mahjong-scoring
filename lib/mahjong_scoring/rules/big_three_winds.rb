module Rules
  class BigThreeWinds < StandardHand
    def self.score() 12 end

    def self.match?(hand)
      super and
      (hand.pungs + hand.kongs).select(&:wind?).count == 3
    end
  end
end
