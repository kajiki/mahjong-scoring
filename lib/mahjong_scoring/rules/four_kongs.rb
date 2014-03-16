module Rules
  class FourKongs < StandardHand
    def self.score() 88 end

    def self.match? (hand)
      super and hand.kongs.count == 4
    end
  end
end
