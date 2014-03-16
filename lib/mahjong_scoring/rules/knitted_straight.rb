module Rules
  class KnittedStraight
    def self.score() 12 end

    def self.match?(hand)
      like_standard_hand?(hand) and
      hand.knitted_sets.map(&:rank).uniq.count == 3 and
      hand.knitted_sets.map(&:tile_type).uniq.count == 3
    end

    private
    def self.like_standard_hand?(hand)
      hand.tilesets.count == 5 and
      hand.knitted_sets.count == 3 and
      (hand.pungs + hand.kongs + hand.chows).count == 1 and
      hand.pairs.count == 1
    end
  end
end
