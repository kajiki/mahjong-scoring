module Rules
  class AllPungs
    def self.score() 6 end

    def self.match?(hand)
      (hand.pungs + hand.kongs).count == 4
    end
  end
end
