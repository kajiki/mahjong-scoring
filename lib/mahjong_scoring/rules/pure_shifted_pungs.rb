module Rules
  class PureShiftedPungs < StandardHand
    def self.score() 24 end

    def self.match?(hand)
      super and
      shifted? (hand.pungs + hand.kongs).select(&:suited?)
    end

    def self.shifted?(sets)

      sets.combination(3).any? do |arr|
        ranks = arr.map(&:rank).sort
        types = arr.map(&:tile_type)

        ranks == [
          ranks.first,
          ranks.first + 1,
          ranks.first + 2
        ] and
        types.uniq.count == 1
      end
    end

  end
end
