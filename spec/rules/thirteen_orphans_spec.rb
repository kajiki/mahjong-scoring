require "spec_helper"

describe Rules::ThirteenOrphans do
  subject { described_class }

  its(:score) { should == 88 }

  it "matches one of each terminal and honor + 1 duplicate" do
    should match_hand ["1/ 9/ 1• 9• 1# 9# 東 南 西 北 中 發 白 1/"]

    should_not match_hand ["1/ 1/ 1• 9• 1# 9# 東 南 西 北 中 發 白 1/"]
    should_not match_hand ["1/ 9/ 1• 9• 1# 9# 東 南 西 北 中 發 白 白 1/"]
    should_not match_hand ["1/ 9/ 1• 9• 1# 9# 東 南 西 北 中 發 白 2/"]
  end
end
