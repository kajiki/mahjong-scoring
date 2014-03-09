require "spec_helper"

describe Rules::LittleThreeDragons do
  subject { described_class }

  its(:score) { should == 64 }

  it "matches a standard hand with two pungs/kongs of dragons and a pair of the third" do
    should match_hand ["C C C C", "F F F", "1• 2• 3•", "S S S", "B B"]

    should_not match_hand ["C C C C", "F F F", "B B B", "1• 2• 3•", "S S"]
    should_not match_hand ["C C C C", "F F F", "B B"]
  end
end
