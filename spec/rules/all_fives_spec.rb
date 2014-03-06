require "spec_helper"

describe Rules::AllFives do
  subject { described_class }

  its(:score) { should == 16 }

  it "should match a standard hand containing all three rank 5 tiles at least once each" do
    should match_hand ["4/ 5/ 6/", "5• 5• 5•", "E E E", "2# 2# 2#", "5# 5#"]

    should_not match_hand ["4/ 5/ 6/", "7• 7• 7•", "E E E", "2# 2# 2#", "5# 5#"]
    should_not match_hand ["4/ 5/ 6/", "5• 5• 5•", "2# 2# 2#", "5# 5#"]
    should_not match_hand ["5/ 5/", "5•", "5#"]
  end
end
