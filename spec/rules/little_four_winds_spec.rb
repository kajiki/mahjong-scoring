require "spec_helper"

describe Rules::LittleFourWinds do
  subject { described_class }

  its(:score) { should == 64 }

  it "matches a standard hand with three pungs/kongs of winds and a pair of the fourth" do
    should match_hand ["W W W W", "S S S", "N N N", "2# 2# 2#", "E E"]

    should_not match_hand ["W W W W", "S S S", "N N N", "E E E", "2# 2#"]
    should_not match_hand ["W W W W", "S S S", "N N N", "E E"]
  end
end
