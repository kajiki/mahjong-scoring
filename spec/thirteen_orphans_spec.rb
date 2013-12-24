require "spec_helper"

describe MahjongScoring, "Thirteen Orphans" do
  it "is worth 88 points" do
    hand = %w[1● 9● 1/ 9/ 1# 9# E W N S 中 發 白 1/]
    score = MahjongScoring.score(hand)

    score.rules.must_equal [:thirteen_orphans]
    score.sum.must_equal 88
  end
end