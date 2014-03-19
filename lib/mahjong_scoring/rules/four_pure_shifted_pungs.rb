module Rules
  class FourPureShiftedPungs < StandardHand
    def self.score() 48 end

    def self.match?(hand)
      tilesets = (hand.pungs + hand.kongs).select(&:suited?)
      
      super and
      tilesets.map(&:tile_type).uniq.count == 1 and
      shifted? tilesets.map(&:rank).sort
    end

    def self.shifted?(ranks)
      ranks == [
        ranks.first,
        ranks.first + 1,
        ranks.first + 2,
        ranks.first + 3
      ]
    end
  end
end
