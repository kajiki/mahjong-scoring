module Rules
  class DragonPung < StandardHand
    def self.score() 2 end

    def self.match?(hand)
      super and
      (hand.pungs + hand.kongs).select(&:dragon?).count == 1
    end
  end
end
