module Rules
  class BigThreeDragons < StandardHand
    def self.score() 88 end

    def self.match?(hand)
      super and
      (hand.pungs + hand.kongs).select(&:dragon?).count == 3
    end
  end
end
