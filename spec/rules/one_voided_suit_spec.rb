require "spec_helper"

describe Rules::OneVoidedSuit do
  subject { described_class }

  its(:score) { should == 1 }

  it "matches a standard hand with one suit missing" do
    should match_hand ["1/ 2/ 3/", "4• 4• 4•", "E E E", "6• 6• 6•", "8/ 8/"]
    should match_hand ["1# 2# 3#", "4• 4• 4•", "E E E", "6• 6• 6•", "8# 8#"]
    should match_hand ["1# 2# 3#", "4/ 4/ 4/", "E E E", "6/ 6/ 6/", "8# 8#"]

    should_not match_hand ["1/ 2/ 3/", "4• 4• 4•", "F F F", "B B B", "8# 8#"]
    should_not match_hand ["1/ 2/ 3/", "4• 4• 4•", "C C", "E E", "8• 8•"]
  end
end
