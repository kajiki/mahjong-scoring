module Rules
  class QuadrupleChow < StandardHand
    def self.score() 48 end

    def self.match?(hand)
      super and
      hand.chows.map(&:tile_type).uniq.count == 1 and
      hand.chows.map(&:rank).uniq.count == 1 and
      hand.chows.count == 4
    end
  end
end
