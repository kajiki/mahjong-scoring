require "spec_helper"

describe Rules::TriplePung do
  subject { described_class }

  its(:score) { should == 16 }

  it "matches a standard hand with three pungs/kongs of the same rank and all three suits" do
    should match_hand ["1• 2• 3•", "8# 8# 8#", "8• 8• 8• 8•", "8/ 8/ 8/", "W W"]
    should match_hand ["8# 8# 8#", "3• 3• 3•", "8• 8• 8•", "8/ 8/ 8/", "1# 1#"]

    should_not match_hand ["8# 8# 8#", "3• 3• 3•", "8• 8• 8•", "5/ 5/ 5/", "1# 1#"]
    should_not match_hand ["8# 8# 8#", "3• 3• 3•", "8• 8• 8•", "8/ 8/ 8/"]
  end
end
