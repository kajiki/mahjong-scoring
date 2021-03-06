require "spec_helper"

describe Rules::FullFlush do
  subject { described_class }

  its(:score) { should == 24 }

  it "matches a standard hand entirely made up of one suit" do
    should match_hand ["1/ 1/ 1/", "3/ 4/ 5/", "2/ 2/ 2/", "6/ 7/ 8/", "8/ 8/"]
    should match_hand ["3• 3• 3•", "4• 5• 6•", "2• 2• 2•", "6• 7• 8•", "9• 9•"]
    should match_hand ["1# 1# 1#", "3# 4# 5#", "2# 2# 2# 2#", "6# 7# 8#", "6# 6#"]

    should_not match_hand ["1# 1# 1#", "3# 4# 5#", "2# 2# 2#", "8# 8#"]
    should_not match_hand ["E E E", "3• 4• 5•", "2• 2• 2•", "6• 7• 8•", "8• 8•"]
    should_not match_hand ["1• 1• 1•", "3# 4# 5#", "2/ 2/ 2/", "6/ 7/ 8/", "8/ 8/"]
  end
end
