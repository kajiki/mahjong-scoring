require "spec_helper"

describe Rules::SevenPairs do
  subject { described_class }

  its(:score) { should == 24 }

  it "matches a hand of seven pairs" do
    should match_hand ["S S", "4/ 4/", "9• 9•", "2• 2•", "3# 3#", "N N", "7/ 7/"]

    should_not match_hand ["S S", "4/ 4/", "9• 9•", "2• 2•", "3# 3#", "N N"]
    should_not match_hand ["4/ 4/ 4/", "9• 9• 9•", "3# 3# 3#", "N N N", "2• 2•"]
  end
end
