require "spec_helper"

describe Rules::AllHonors do
  subject { described_class }

  its(:score) { should == 64 }

  it "matches a standard hand with only honor tiles" do
    should match_hand ["東 東 東", "南 南 南 南", "中 中 中", "發 發 發", "北 北"]

    should_not match_hand ["東 東 東", "南 南 南 南", "中 中 中", "發 發 發", "4/ 4/"]
    should_not match_hand ["東 東 東", "南 南 南 南", "中 中 中", "發 發 發"]
  end
end
