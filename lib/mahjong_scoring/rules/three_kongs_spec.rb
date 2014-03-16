require "spec_helper"

describe Rules::ThreeKongs do
  subject { described_class }

  its(:score) { should == 32 }

  it "matches a standard hand with three kongs" do
    should match_hand ["E E E E","9# 9# 9#", "6/ 6/ 6/ 6/", "2• 2• 2• 2•", "S S"]

    should_not match_hand ["E E E E","9# 9# 9#", "6/ 6/ 6/", "2• 2• 2• 2•", "S S"]
    should_not match_hand ["E E E E","9# 9# 9#", "6/ 6/ 6/ 6/", "2• 2• 2• 2•"]
  end
end
