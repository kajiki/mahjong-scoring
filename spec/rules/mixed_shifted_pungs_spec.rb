require "spec_helper"

describe Rules::MixedShiftedPungs do
  subject { described_class }

  its(:score) { should == 8 }

  it "matches a standard hand with three pungs/kongs in all three suits and consecutive ranks" do
    should match_hand ["3/ 3/ 3/ 3/", "4# 4# 4#", "5• 5• 5•", "6/ 6/ 6/", "F F"]

    should_not match_hand ["3/ 3/ 3/ 3/", "4# 4# 4#", "8• 8• 8•", "9/ 9/ 9/", "F F"]
    should_not match_hand ["3/ 3/ 3/ 3/", "4• 4• 4•", "5• 5• 5•", "6/ 6/ 6/", "F F"]
    should_not match_hand ["3/ 3/ 3/ 3/", "4# 4# 4#", "5• 5• 5•", "6/ 6/ 6/"]
  end
end
