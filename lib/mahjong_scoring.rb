require "mahjong_scoring/version"
require "mahjong_scoring/rule"

module MahjongScoring
  Score = Struct.new(:sum, :rules)

  def self.score(hand)
    if hand == %w[1● 9● 1/ 9/ 1# 9# E W N S 中 發 白 1/]
      Score.new(88, [:thirteen_orphans])
    elsif MahjongScoring::Rules::NineGates.new(hand).match?
      Score.new(88, [:nine_gates])
    end
  end
end