module Rules
  class DoublePung < StandardHand
    def self.score() 2 end

    def self.match?(hand)
      super && double_pung?(hand)
    end

    private
    def self.double_pung?(hand)
      (hand.pungs + hand.kongs).select(&:suited?).group_by(&:rank).any? do |_, pungs|
        pungs.map(&:tile_type).uniq.count == 2
      end
    end
  end
end
