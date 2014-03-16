module Rules
  class TriplePung < StandardHand
    def self.score() 16 end

    def self.match?(hand)
      super && triple_pung?(hand)
    end

    private
    def self.triple_pung?(hand)
      (hand.pungs + hand.kongs).select(&:suited?).group_by(&:rank).any? do |_, pungs|
        pungs.map(&:tile_type).uniq.count == 3
      end
    end
  end
end
