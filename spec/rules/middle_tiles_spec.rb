require "spec_helper"

describe Rules::MiddleTiles do
  subject { described_class }

  its(:score) { should == 24 }

  it "matches a standard hand with only ranks 4-6" do
    should match_hand ["4• 4• 4•", "6• 6• 6•", "5# 5# 5#", "4/ 5/ 6/", "4# 4#"]

    should_not match_hand ["9• 9• 9•", "4• 4• 4•", "6• 6• 6•", "5# 5# 5#", "4/ 5/ 6/", "4# 4#"]
    should_not match_hand ["4• 4• 4•", "6• 6• 6•", "5# 5# 5#", "F F F", "4# 4#"]
    should_not match_hand ["4• 4• 4•", "6• 6• 6•", "5# 5# 5#", "4# 4#"]
  end
end
