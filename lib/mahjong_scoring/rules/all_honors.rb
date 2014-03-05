module Rules
  class AllHonors < StandardHand
    def self.score() 64 end

    def self.match?(hand)
      super and
        hand.tiles.all? { |t| t.honor? }
    end
  end
end
