require "spec_helper"

describe Rules::PureShiftedChows do
  subject { described_class }

  its(:score) { should == 16 }

  it "matches a standard hand with three chows in the same suit, each one rank higher than the last" do
    should match_hand ["2/ 3/ 4/", "3/ 4/ 5/", "4/ 5/ 6/", "7• 8• 9•", "3# 3#"]

    should_not match_hand ["2/ 3/ 4/", "3/ 4/ 5/", "4• 5• 6•", "7• 8• 9•", "3# 3#"]
  end

  it "matches a standard hand with three chows in the same suit, each two ranks higher than the last" do
    should match_hand ["3# 4# 5#", "5# 6# 7#", "7# 8# 9#", "4/ 5/ 6/", "S S"]

    should_not match_hand ["3# 4# 5#", "5# 6# 7#", "7• 8• 9•", "4/ 5/ 6/", "S S"]
  end

  it "rejects inconsistend hands" do
    should_not match_hand ["1/ 2/ 3/", "2/ 3/ 4/", "4/ 5/ 6/", "5/ 6/ 7/", "3# 3#"]
  end

  it "rejects invalid hands" do
    should_not match_hand ["3# 4# 5#", "5# 6# 7#", "7# 8# 9#", "4/ 5/ 6/"]
  end

end
