module Rules
  class ThirteenOrphans
    def self.score() 88 end

    def self.match?(hand)
      hand.tiles.count == 14 and 
        hand.tiles.uniq.count == 13 and
        hand.tiles.all? { |tile| tile.terminal? or tile.honor? }
    end
  end
end


