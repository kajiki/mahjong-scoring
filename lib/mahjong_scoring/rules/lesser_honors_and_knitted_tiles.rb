module Rules
  class LesserHonorsAndKnittedTiles
    KNITTED_SETS = [
        [1, 4, 7],
        [2, 5, 8],
        [3, 6, 9]
      ].freeze

    def self.score() 12 end

    def self.match?(hand)
      non_standard_hand?(hand) and
      all_knitted? hand.tiles.select(&:suited?)
    end

    def self.non_standard_hand?(hand)
      tiles = hand.tiles
      honors = tiles.select(&:honor?)
      suited = tiles.select(&:suited?)

      tiles.count == 14 and
      tiles.uniq.count == tiles.count and
      honors.uniq.count == honors.count and
      suited.map(&:rank).uniq.count == suited.map(&:rank).count and
      suited.map(&:type).uniq.count >= 3
    end

    def self.all_knitted?(knitted_tiles)
      knitted_suits = knitted_tiles.select(&:suited?).map(&:type).uniq

      knitted_suits.all? do |suit|
        knitted? knitted_tiles.select { |t| t.type == suit }.map(&:rank)
      end
    end

    def self.knitted?(input_array)
      KNITTED_SETS.any? { |sequence| sequence | input_array == sequence }
    end
  end
end
