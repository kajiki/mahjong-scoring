require "spec_helper"

describe Rules::AllChows do
  subject { described_class }

  its(:score) { should == 2 }

  it "matches a standard hand with no pungs/kongs and no honors" do
    should match_hand ["3/ 4/ 5/", "7• 8• 9•", "2# 3# 4#", "6• 7• 8•", "1# 1#"]

    should_not match_hand ["3/ 4/ 5/", "7• 8• 9•", "2# 3# 4#", "6• 7• 8•", "N N"]
    should_not match_hand ["3/ 4/ 5/", "7• 7• 7•", "2# 3# 4#", "6• 7• 8•", "1# 1#"]
    should_not match_hand ["3/ 4/ 5/", "7• 8• 9•", "2# 3# 4#", "6• 7• 8•"]
  end
end
