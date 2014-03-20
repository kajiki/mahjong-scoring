require "spec_helper"

describe Rules::QuadrupleChow do
  subject { described_class }

  its(:score) { should == 48 }

  it "matches a standard hand with four identical chows" do
    should match_hand ["2/ 3/ 4/", "2/ 3/ 4/", "2/ 3/ 4/", "2/ 3/ 4/", "8• 8•"]
    should match_hand ["3/ 4/ 5/", "3/ 4/ 5/", "3/ 4/ 5/", "3/ 4/ 5/", "8• 8•"]

    should_not match_hand ["2/ 3/ 4/", "2# 3# 4#", "2/ 3/ 4/", "2/ 3/ 4/", "8• 8•"]
    should_not match_hand ["2/ 3/ 4/", "2/ 3/ 4/", "2/ 3/ 4/", "7# 7# 7#", "8• 8•"]
    should_not match_hand ["2/ 3/ 4/", "3/ 4/ 5/", "2/ 3/ 4/", "2/ 3/ 4/", "8• 8•"]
    should_not match_hand ["2/ 3/ 4/", "2/ 3/ 4/", "2/ 3/ 4/", "2/ 3/ 4/"]
  end
end
