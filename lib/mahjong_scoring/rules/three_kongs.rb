module Rules
  class ThreeKongs < StandardHand
    def self.score() 32 end

    def self.match? (hand)
      super and hand.kongs.count == 3
    end
  end
end
