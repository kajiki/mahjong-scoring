require "spec_helper"

describe Mahjong::Scoring, "Nine Gates" do
  it "is worth 88 points" do
    hand = %w[1● 1● 1● 2● 3● 4● 5● 6● 7● 8● 9● 9● 9●]
    score = Mahjong::Scoring.score(hand)

    score.rules.must_equal [:nine_gates]
    score.sum.must_equal 88
  end
end