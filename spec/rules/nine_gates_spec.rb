require "spec_helper"
require "mahjong_scoring/rules/nine_gates"

describe MahjongScoring::Rules::NineGates do
  def hand(tiles)
    MahjongScoring::Rules::NineGates.new(tiles)
  end

  it "is worth 88 points" do
    skip
    valid_hand.must_be_worth(88.points)
  end

  it "it valid with all circles" do
    hand(%w[1● 1● 1● 2● 3● 4● 5● 6● 7● 8● 9● 9● 9●]).must_match
  end

  it "is valid with all bamboo" do
    hand(%w[1/ 1/ 1/ 2/ 3/ 4/ 5/ 6/ 7/ 8/ 9/ 9/ 9/]).must_match
  end

  it "is valid with all characters" do
    hand(%w[1# 1# 1# 2# 3# 4# 5# 6# 7# 8# 9# 9# 9#]).must_match
  end
end