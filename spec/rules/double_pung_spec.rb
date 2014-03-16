require "spec_helper"

describe Rules::DoublePung do
  subject { described_class }

  its(:score) { should == 2 }

  it "matches a standard hand with any two pungs/kongs of the same rank and different suits" do
    should match_hand ["1• 2• 3•", "8# 8# 8#", "8• 8• 8• 8•", "5/ 5/ 5/", "W W"]
    should match_hand ["8• 8• 8•", "C C C", "1• 2• 3•", "8/ 8/ 8/", "1# 1#"]
    should match_hand ["8• 8• 8•", "3• 3• 3•", "1/ 2/ 3/", "8# 8# 8#", "E E"]

    should_not match_hand ["8# 8# 8#", "3• 3• 3•", "5• 5• 5•", "4/ 4/ 4/", "1# 1#"] 
    should_not match_hand ["1• 2• 3•", "8# 8# 8#", "8• 8• 8• 8•", "W W"]
  end
end
