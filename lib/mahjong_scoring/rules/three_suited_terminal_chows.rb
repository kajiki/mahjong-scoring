module Rules
  class ThreeSuitedTerminalChows < StandardHand
    def self.score() 16 end

    def self.match?(hand)
      super and
      hand.tiles.map(&:type).uniq.count == 3 and
      hand.chows.group_by(&:tile_type).map(&:count) == [2, 2] and
      hand.chows.group_by(&:tile_type).all? { |_, chows| chows.map(&:rank).sort == [1,7] } and
      hand.pairs.map(&:rank) == [5]
    end
  end
end
