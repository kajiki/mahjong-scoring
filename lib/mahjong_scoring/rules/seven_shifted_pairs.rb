module Rules
  class SevenShiftedPairs
    def self.score() 88 end

    def self.match?(hand)
      ranks = hand.tiles.sort.select { |t| t.suited? }.uniq.map(&:rank)

      within_range? ranks and
      hand.tiles.map(&:type).uniq.count == 1 and
      hand.tiles.count == 14 and
      hand.pairs.count == 7
    end

    def self.within_range?(ranks)
      first_rank = ranks.first
      ranks == (first_rank..first_rank+6).to_a
    end
  end
end
