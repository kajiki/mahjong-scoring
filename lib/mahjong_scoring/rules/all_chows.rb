module Rules
  class AllChows < StandardHand
    def self.score() 2 end

    def self.match?(hand)
      super and
      hand.pungs.none? and hand.kongs.none? and
      hand.tiles.none?(&:honor?)
    end
  end
end
