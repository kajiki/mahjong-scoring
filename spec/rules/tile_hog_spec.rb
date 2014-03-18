require "spec_helper"

describe Rules::TileHog do
  subject { described_class }

  its(:score) { should == 2 }

  it "matches a standard hand with all four tiles of one type spread over several sets" do
    should match_hand ["5• 6• 7•", "7• 7• 7•", "W W W", "3# 4# 5#", "9/ 9/"]
    should match_hand ["1/ 2/ 3/", "3/ 4/ 5/", "C C C", "4• 4• 4•", "3/ 3/"]
  end

  it "ignores kongs" do
    should match_hand ["2/ 2/ 2/ 2/", "4# 4# 4#", "4# 5# 6#", "9• 9• 9•", "N N"]
    should_not match_hand ["9# 9# 9# 9#", "3/ 4/ 5/", "2• 3• 4•", "7• 8• 9•", "E E"]
  end

  it "rejects invalid hands" do
    should_not match_hand ["5• 6• 7•", "7• 7• 7•", "W W W", "9/ 9/"]
  end
end
