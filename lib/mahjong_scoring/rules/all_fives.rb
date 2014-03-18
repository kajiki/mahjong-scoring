module Rules
  class AllFives < StandardHand
    def self.score() 16 end

    def self.match?(hand)
      super and
      hand.tilesets.all? { |tileset| tileset.tiles.map(&:rank).include?(5) }
    end
  end
end
