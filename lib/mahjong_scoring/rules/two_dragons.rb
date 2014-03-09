module Rules
  class TwoDragons < StandardHand
    def self.score() 6 end

    def self.match?(hand)
      super and
      (hand.pungs + hand.kongs).select(&:dragon?).count == 2
    end
  end
end
