module Rules
  class TileHog < StandardHand
    def self.score() 2 end

    def self.match?(hand)
      super and
      hand.tiles.group_by(&:to_s).any? do |_, tiles| 
        tiles.count == 4 and not
        hand.kongs.any? { |kong| kong.tiles == tiles }
      end
    end
  end
end
