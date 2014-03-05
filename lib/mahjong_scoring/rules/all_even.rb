module Rules
  class AllEven < StandardHand
    def self.score() 24 end

    def self.match?(hand)
      super and 
      hand.tiles.all? { |t| !t.rank.nil? and t.rank.even? }
    end
  end
end
