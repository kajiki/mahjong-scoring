module Rules
  class FourShiftedChows < StandardHand
    def self.score() 32 end

    def self.match?(hand)
      super and
      hand.chows.map(&:tile_type).uniq.count == 1 and
      shifted? hand.chows.map(&:rank)
    end

    def self.shifted?(ranks)
      (
        ranks == [
          ranks.first,
          ranks.first + 1,
          ranks.first + 2,
          ranks.first + 3
        ] or
        ranks == [
          ranks.first,
          ranks.first + 2,
          ranks.first + 4,
          ranks.first + 6
        ]
      )
    end
  end
end
