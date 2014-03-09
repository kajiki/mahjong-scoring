require "spec_helper"

describe Rules::BigFourWinds do
  subject { described_class }

  its(:score) { should == 88 }

  it "matches a standard hand with pungs/kongs of all four winds" do
    should match_hand ["W W W W", "S S S", "N N N", "E E E", "2# 2#"]

    should_not match_hand ["W W W W", "S S S", "N N N", "C C C", "2# 2#"]
    should_not match_hand ["W W W W", "S S S", "N N N", "E E E"]
  end
end
