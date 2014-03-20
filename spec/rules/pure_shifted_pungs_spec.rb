require "spec_helper"

describe Rules::PureShiftedPungs do
  subject { described_class }

  its(:score) { should == 24 }

  it "matches a standard hand with three pungs/kongs of three consecutive ranks in the same suit" do
    should match_hand ["4• 4• 4•", "5• 5• 5• 5•", "6• 6• 6•", "7/ 7/ 7/", "2# 2#"]

    should_not match_hand ["4• 4• 4•", "5• 5• 5• 5•", "6# 6# 6#", "7/ 7/ 7/", "E E"]
    should_not match_hand ["4• 4• 4•", "5• 5• 5• 5•", "6• 7• 8•", "7/ 7/ 7/", "2# 2#"]
    should_not match_hand ["4• 4• 4•", "5• 5• 5• 5•", "6• 6• 6•", "2# 2#"]
  end
end
