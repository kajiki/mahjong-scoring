require "spec_helper"

describe Rules::AllTerminals do
  subject { described_class }

  its(:score) { should == 64 }

  it "matches a standard hand with only terminal tiles" do
    should match_hand ["1/ 1/ 1/", "9/ 9/ 9/ 9/", "1• 1• 1•", "9# 9# 9#", "1# 1#"]

    should_not match_hand ["1/ 1/ 1/", "9/ 9/ 9/ 9/", "4• 4• 4•", "9# 9# 9#", "9/ 9/"]
    should_not match_hand ["1/ 1/ 1/", "9/ 9/ 9/ 9/", "1• 1• 1•", "9# 9# 9#", "發 發"]
    should_not match_hand ["1/ 1/ 1/", "9/ 9/ 9/ 9/", "1• 1• 1•", "9# 9# 9#"]
  end
end
