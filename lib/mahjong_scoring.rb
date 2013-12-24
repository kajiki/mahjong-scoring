require "mahjong_scoring/version"

module MahjongScoring
  Score = Struct.new(:sum, :rules)

  def self.score(hand)
    case hand
    when %w[1● 9● 1/ 9/ 1# 9# E W N S 中 發 白 1/]
      Score.new(88, [:thirteen_orphans])
    when %w[1● 1● 1● 2● 3● 4● 5● 6● 7● 8● 9● 9● 9●]
      Score.new(88, [:nine_gates])
    end
  end
end