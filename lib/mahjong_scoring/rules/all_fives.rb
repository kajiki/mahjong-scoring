module Rules
  class AllFives < StandardHand
    def self.score() 16 end

    def self.match?(hand)
      super and
      hand.tiles.select{ |t| t.rank == 5 }.map(&:type).uniq.count == 3
    end
  end
end
