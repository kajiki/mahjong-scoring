require "spec_helper"

describe Rules::BigThreeDragons do
  subject { described_class }

  its(:score) { should == 88 }

  it "matches a standard hand with pungs/kongs of all three dragons" do
    should match_hand ["C C C C", "F F F", "B B B", "1• 2• 3•", "S S"]

    should_not match_hand ["C C C C", "F F F", "1• 2• 3•", "S S S", "B B"]
    should_not match_hand ["C C C C", "F F F", "B B B", "3• 3•"]
  end
end
