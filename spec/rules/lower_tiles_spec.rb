require "spec_helper"

describe Rules::LowerTiles do
  subject { described_class }

  its(:score) { should == 24 }

  it "matches a standard hand with only ranks 1-3" do
    should match_hand ["1• 1• 1•", "3• 3• 3•", "2# 2# 2#", "1/ 2/ 3/", "1# 1#"]

    should_not match_hand ["5• 5• 5•", "3• 3• 3•", "2# 2# 2#", "1/ 2/ 3/", "1# 1#"]
    should_not match_hand ["1• 1• 1•", "3• 3• 3•", "2# 2# 2#", "F F F", "1# 1#"]
    should_not match_hand ["1• 1• 1•", "3• 3• 3•", "2# 2# 2#", "1# 1#"]
  end
end
