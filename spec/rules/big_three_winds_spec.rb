require "spec_helper"

describe Rules::BigThreeWinds do
  subject { described_class }

  its(:score) { should == 12 }

  it "matches a standard hand with three pungs/kongs of winds" do
    should match_hand ["W W W W", "S S S", "N N N", "3• 4• 5•", "F F"]

    should_not match_hand ["W W W W", "S S S", "3• 4• 5•", "C C C", "2# 2#"]
    should_not match_hand ["W W W W", "S S S", "N N N", "3• 4• 5•"]
  end
end
