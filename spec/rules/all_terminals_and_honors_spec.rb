require "spec_helper"

describe Rules::AllTerminalsAndHonors do
  subject { described_class }

  its(:score) { should == 32 }

  it "matches a standard hand with only honor and terminal tiles" do
    should match_hand ["東 東 東", "南 南 南 南", "1/ 1/ 1/", "發 發 發", "9• 9•"]

    should_not match_hand ["東 東 東", "南 南 南 南", "中 中 中", "發 發 發", "白 白"]
    should_not match_hand ["1/ 1/ 1/", "9/ 9/ 9/ 9/", "1• 1• 1•", "9# 9# 9#", "1# 1#"]
    should_not match_hand ["3# 3# 3#", "南 南 南 南", "1/ 1/ 1/", "發 發 發", "9• 9•"]
    should_not match_hand ["東 東 東", "南 南 南 南", "1/ 1/ 1/", "9• 9•"]
  end
end
