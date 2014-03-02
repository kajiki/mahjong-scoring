module Rules
  class StandardHand
    def self.match?(hand)
      hand.tilesets.count == 5 and
        (hand.pungs + hand.kongs + hand.chows).count == 4 and 
        hand.pairs.count == 1
    end
  end
end
