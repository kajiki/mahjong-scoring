require "spec_helper"

describe Rules::ReversibleTiles do
  subject { described_class }

  its(:score) { should == 8 }

  it "matches a standard hand with only reversible tiles" do
    should match_hand ["2/ 2/ 2/ 2/", "4/ 4/ 4/", "3• 3• 3•", "8• 8• 8•", "白 白"]

    should_not match_hand ["2/ 2/ 2/ 2/", "4/ 4/ 4/", "3• 3• 3•", "8• 8• 8•", "9# 9#"]
    should_not match_hand ["2/ 2/ 2/ 2/", "4/ 4/ 4/", "3• 3• 3•", "8• 8• 8•"]
  end
end

