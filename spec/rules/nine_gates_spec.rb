require "spec_helper"

describe Rules::NineGates do
  subject { described_class }

  its(:score) { should == 88 }

  it "matches a hand of one single suit with two terminal pungs, single simples and one duplicate simple" do
    should match_hand ["1/ 1/ 1/", "2/ 3/ 4/", "5/ 6/ 7/", "9/ 9/ 9/", "8/ 8/"]
    should match_hand ["1• 2• 3•", "4• 5• 6•", "7• 8• 9•", "9• 9• 9•", "1• 1•"]
    should match_hand ["1# 1# 1#", "1# 2# 3#", "4# 5# 6#", "7# 8# 9#", "9# 9#"]
  end

  it "rejects invalid sequences" do
    should_not match_hand ["1/ 1/ 1/ 1/", "2/ 3/ 4/", "5/ 6/ 7/", "9/ 9/ 9/", "8/ 8/"]
    should_not match_hand ["1# 1# 1#", "1# 2# 3#", "4# 5# 6#", "7# 8# 9#", "4# 4#"]
    should_not match_hand ["1# 2# 3#", "2# 3# 4#", "4# 5# 6#", "7# 8# 9#", "9# 9#"]
    should_not match_hand ["1• 2• 3•", "4• 5• 6•", "7• 8• 9•", "9• 9• 9•", "C C"]
  end

  it "rejects hands with ranks missing" do
    should_not match_hand ["1• 2• 3•", "4• 5• 6•", "8• 8• 8•", "9• 9• 9•", "1• 1•"]
    should_not match_hand ["1/ 1/ 1/", "1/ 2/ 3/", "3/ 4/ 5/", "9/ 9/ 9/", "6/ 6/"]
  end

  it "rejects hands with mixed suits" do
    should_not match_hand ["1/ 1/ 1/", "2/ 3/ 4/", "5/ 6/ 7/", "9/ 9/ 9/", "8• 8•"]
  end

  it "rejects invalid hands" do
    should_not match_hand ["1# 1#", "1# 2# 3#", "4# 5# 6#", "7# 8# 9#", "9# 9#"]
  end
end
