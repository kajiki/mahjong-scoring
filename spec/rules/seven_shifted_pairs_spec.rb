require "spec_helper"

describe Rules::SevenShiftedPairs do
  subject { described_class }

  its(:score) { should == 88 }

  it "matches a hand of seven pairs of the same suit in sequence" do
    should match_hand ["8/ 8/", "2/ 2/", "6/ 6/", "4/ 4/", "3/ 3/", "7/ 7/", "5/ 5/"]
    should match_hand ["8• 8•", "9• 9•", "6• 6•", "4• 4•", "3• 3•", "7• 7•", "5• 5•"]
    should match_hand ["1# 1#", "2# 2#", "6# 6#", "4# 4#", "3# 3#", "7# 7#", "5# 5#"]
  end

  it "rejects broken sequences" do
    should_not match_hand ["8/ 8/", "2/ 2/", "6/ 6/", "1/ 1/", "3/ 3/", "7/ 7/", "5/ 5/"]
  end

  it "rejects mixed suits" do
    should_not match_hand ["8• 8•", "9• 9•", "6• 6•", "4# 4#", "3• 3•", "7• 7•", "5• 5•"]
  end

  it "rejects the wrong amount of pairs" do
    should_not match_hand ["1# 1#", "2# 2#", "6# 6#", "4# 4#", "3# 3#", "7# 7#", "5# 5#", "N N"]
    should_not match_hand ["8• 8•", "6• 6•", "4• 4•", "3• 3•", "7• 7•", "5• 5•"]
  end
end
