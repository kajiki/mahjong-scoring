require "spec_helper"

describe Rules::NoHonors do
  subject { described_class }

  its(:score) { should == 1 }

  it "matches a standard hand with no honor tiles" do
    should match_hand ["3/ 4/ 5/", "1• 1• 1• 1•", "7# 7# 7#", "7• 8• 9•", "6# 6#"]

    should_not match_hand ["3/ 4/ 5/", "1• 1• 1• 1•", "7# 7# 7#", "7• 8• 9•", "S S"]
    should_not match_hand ["3/ 4/ 5/", "1• 1• 1• 1•", "7# 7# 7#", "7• 8• 9•"]
  end
end
