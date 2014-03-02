module Rules
  class AllPungs < StandardHand
    def self.score() 6 end

    def self.match?(hand)
      super and (hand.pungs + hand.kongs).count == 4
    end
  end
end
