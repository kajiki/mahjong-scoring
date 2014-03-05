require "spec_helper"

describe Rules::AllEven do
  subject { described_class }

  its(:score) { should == 24 }

  it "matches a standard hand with only tiles of even rank" do
    should match_hand ["2• 2• 2•", "4/ 4/ 4/", "6# 6# 6# 6#", "8# 8# 8#", "4/ 4/"]

    should_not match_hand ["2• 2• 2•", "4/ 4/ 4/", "5# 5# 5#", "8# 8# 8#", "4/ 4/"]
    should_not match_hand ["2• 2• 2•", "4/ 4/ 4/", "W W W", "8# 8# 8#", "4/ 4/"]
    should_not match_hand ["2• 2• 2•", "4/ 4/ 4/", "6# 6# 6#", "8/ 8/"]
  end
end
