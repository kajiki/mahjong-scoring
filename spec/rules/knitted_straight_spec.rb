require "spec_helper"

describe Rules::KnittedStraight do
  subject { described_class }

  its(:score) { should == 12 }

  it "matches a 14 tile hand of tile sequences with 3 tiles separated by three, each sequence in a different suit" do
    should match_hand ["1/ 4/ 7/", "2• 5• 8•", "3# 6# 9#", "B B B", "4/ 4/"]
  end

  it "rejects a hand with duplicated knitted types or ranks" do
    should_not match_hand ["1/ 4/ 7/", "2/ 5/ 8/", "3# 6# 9#", "B B B", "4• 4•"]
    should_not match_hand ["1/ 4/ 7/", "2• 5• 8•", "2# 5# 8#", "B B B", "4/ 4/"]
  end

  it "rejects invalid sequences" do
    should_not match_hand ["1/ 4/ 6/", "2• 5• 8•", "3# 7# 9#", "B B B", "4/ 4/"]
  end

  it "rejects invalid hands" do
    should_not match_hand ["1/ 4/ 7/", "2• 4• 5• 8•", "3# 6# 9#", "B B B", "4/ 4/"]
    should_not match_hand ["1/ 4/ 7/", "2• 5• 8•", "3# 6# 9#", "4/ 4/"]
  end
end
