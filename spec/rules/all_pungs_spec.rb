require "spec_helper"

describe Rules::AllPungs do
  subject { described_class }

  its(:score) { should == 6 }

  it "matches a standard hand with four pungs/kongs" do
    should match_hand ["1• 1• 1•", "2/ 2/ 2/", "3• 3• 3•", "S S S", "4# 4#"]
    should match_hand ["1• 1• 1•", "2/ 2/ 2/ 2/", "3• 3• 3•", "S S S", "4# 4#"]

    should_not match_hand ["1• 1• 1•", "2/ 2/ 2/ 2/", "3• 3• 3•", "S S S"]
    should_not match_hand ["1/ 1/ 1/", "2/ 2/ 2/", "3/ 3/ 3/", "1/ 2/ 3/", "E E"]
  end
end
