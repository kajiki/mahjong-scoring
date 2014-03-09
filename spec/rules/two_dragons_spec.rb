require "spec_helper"

describe Rules::TwoDragons do
  subject { described_class }

  its(:score) { should == 6 }

  it "matches a standard hand with two pungs/kongs of dragons" do
    should match_hand ["C C C C", "F F F", "5# 5# 5#", "1• 2• 3•", "4/ 4/"]

    should_not match_hand ["6# 6# 6# 6#", "F F F", "5# 5# 5#", "1• 2• 3•", "4/ 4/"]
    should_not match_hand ["C C C C", "F F F", "1• 2• 3•", "3• 3•"]
  end
end
