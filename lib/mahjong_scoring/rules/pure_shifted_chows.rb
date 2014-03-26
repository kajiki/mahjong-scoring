module Rules
  class PureShiftedChows < StandardHand
    def self.score() 16 end

    def self.match?(hand)
      super and
      shifted? hand.chows.select(&:suited?)
    end

    def self.shifted?(chows)
      chows.combination(3).any? do |arr|
        ranks = arr.map(&:rank).sort
        types = arr.map(&:tile_type)

        (
        ranks == [
          ranks.first,
          ranks.first + 1,
          ranks.first + 2
        ] or
        ranks == [
          ranks.first,
          ranks.first + 2,
          ranks.first + 4
        ]
      ) and types.uniq.count == 1
      end
    end
  end
end
