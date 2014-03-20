require "spec_helper"

describe Rules::FourShiftedChows do
  subject { described_class }

  its(:score) { should == 32 }

  it "matches a standard hand with four chows of the same suit, each one rank higher than the last" do
    should match_hand ["1• 2• 3•", "2• 3• 4•", "3• 4• 5•", "4• 5• 6•", "B B"]

    should_not match_hand ["1• 2• 3•", "2• 3• 4•", "7• 7• 7•", "4• 5• 6•", "B B"]
  end

  it "matches a standard hand with four chows of the same suit, each two ranks higher than the last" do
    should match_hand ["1• 2• 3•", "3• 4• 5•", "5• 6• 7•", "7• 8• 9•", "5# 5#"]

    should_not match_hand ["1• 2• 3•", "3• 4• 5•", "5• 6• 7•", "7/ 8/ 9/", "5# 5#"]
  end

  it "rejects inconsistent hands" do
    should_not match_hand ["1/ 2/ 3/", "2/ 3/ 4/", "4/ 5/ 6/", "6/ 7/ 8/", "1/ 1/"]
  end

  it "rejects invalid hands" do
    should_not match_hand ["1• 2• 3•", "2• 3• 4•", "3• 4• 5•", "4• 5• 6•"]
  end
end
