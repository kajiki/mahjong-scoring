require "spec_helper"

describe Rules::AllFives do
  subject { described_class }

  its(:score) { should == 16 }

  it "matches a standard hand with at least one rank 5 tile in all sets" do
    should match_hand ["3/ 4/ 5/", "5• 5• 5•", "5/ 6/ 7/", "4# 5# 6#", "5# 5#"]

    should_not match_hand ["2/ 3/ 4/", "5• 5• 5•", "5/ 6/ 7/", "4# 5# 6#", "5# 5#"]
    should_not match_hand ["3/ 4/ 5/", "5• 5• 5•", "5/ 6/ 7/", "4# 5# 6#", "S S"]
    should_not match_hand ["3/ 4/ 5/", "5• 5• 5•", "5/ 6/ 7/", "4# 5# 6#"]
  end
end
