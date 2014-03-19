require "spec_helper"

describe Rules::FourPureShiftedPungs do
  subject { described_class }

  its(:score) { should == 48 }

  it "matches a standard hand with four pungs/kongs of four consecutive ranks in the same suit" do
    should match_hand ["4• 4• 4•", "5• 5• 5• 5•", "6• 6• 6•", "7• 7• 7•", "2# 2#"]

    should_not match_hand ["4• 4• 4•", "5• 5• 5• 5•", "6/ 6/ 6/", "7• 7• 7•", "2# 2#"]
    should_not match_hand ["4• 4• 4•", "3• 3• 3• 3•", "6• 6• 6•", "7• 7• 7•", "2# 2#"]
    should_not match_hand ["4• 5• 6•", "5• 5• 5• 5•", "6• 6• 6•", "7• 7• 7•", "2# 2#"]
    should_not match_hand ["4• 4• 4•", "5• 5• 5• 5•", "6• 6• 6•", "7• 7• 7•"]
  end
end
