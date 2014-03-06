module Rules
  class OneVoidedSuit < StandardHand
    def self.score() 1 end
      
    def self.match?(hand)
      super && hand.tiles.select(&:suited?).map(&:type).uniq.count == 2
    end
  end
end
