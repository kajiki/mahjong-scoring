require "spec_helper"

describe Rules::LowerFour do
  subject { described_class }

  its(:score) { should == 12 }

  it "matches a standard hand with only ranks 1-4" do
    should match_hand ["4• 4• 4•", "3• 3• 3•", "2# 2# 2#", "1/ 2/ 3/", "1# 1#"]

    should_not match_hand ["5• 5• 5•", "3• 3• 3•", "2# 2# 2#", "1/ 2/ 3/", "4# 4#"]
    should_not match_hand ["4• 4• 4•", "3• 3• 3•", "2# 2# 2#", "F F F", "1# 1#"]
    should_not match_hand ["4• 4• 4•", "3• 3• 3•", "2# 2# 2#", "1# 1#"]
  end
end
