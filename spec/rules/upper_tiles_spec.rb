require "spec_helper"

describe Rules::UpperTiles do
  subject { described_class }

  its(:score) { should == 24 }

  it "matches a standard hand with only ranks 7-9" do
    should match_hand ["7• 7• 7•", "9• 9• 9•", "8# 8# 8#", "7/ 8/ 9/", "7# 7#"]

    should_not match_hand ["5• 5• 5•", "9• 9• 9•", "8# 8# 8#", "7/ 8/ 9/", "7# 7#"]
    should_not match_hand ["7• 7• 7•", "9• 9• 9•", "8# 8# 8#", "F F F", "7# 7#"]
    should_not match_hand ["7• 7• 7•", "9• 9• 9•", "8# 8# 8#", "7# 7#"]
  end
end
