require "mahjong/scoring/version"

module Mahjong
  module Scoring
    Score = Struct.new(:sum, :rules)

    def self.score(hand)
      Score.new(88, [:thirteen_orphans])
    end
  end
end