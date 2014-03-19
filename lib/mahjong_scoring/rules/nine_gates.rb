module Rules
  class NineGates < StandardHand
    def self.score() 88 end

    def self.match?(hand)
      pung_ranks = hand.pungs.map(&:rank)
      tiles = hand.tiles

      super and
      tiles.count == 14 and
      tiles.map(&:rank).uniq.count == 9 and
      tiles.map(&:type).uniq.count == 1 and
      tiles.all? { |t| t.suited? } and
      (pung_ranks.include?(1) or pung_ranks.include?(9)) and
      single_duplicate?(hand)
    end

    def self.single_duplicate?(hand)
      simple_ranks = hand.tiles.select { |t| not t.terminal? }.group_by(&:rank)
      terminal_ranks = hand.tiles.select { |t| t.terminal? }.group_by(&:rank)

      simple_ranks.none? { |_, tiles| tiles.count > 2 } and
      terminal_ranks.none? { |_, tiles| tiles.count > 4 } and (
        simple_ranks.one? { |_, tiles| tiles.count == 2 } or
        terminal_ranks.one? { |_, tiles| tiles.count == 4 }
      )
    end
  end
end
