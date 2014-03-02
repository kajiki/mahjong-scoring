require "spec_helper"

describe Rules::AllPungs do
  subject { described_class }

  it "is worth 6 points" do
    Rules::AllPungs.score.should == 6
  end

  describe "with a standard hand having four pungs" do
    it { should match_hand ["1• 1• 1•", "2/ 2/ 2/", "3• 3• 3•", "S S S", "4# 4#"] }
  end

  describe "with a standard hand having four pungs/kongs" do
    it { should match_hand ["1• 1• 1•", "2/ 2/ 2/ 2/", "3• 3• 3•", "S S S", "4# 4#"] }
  end

  describe "with a non-matching hand" do
    it { should_not match_hand ["1/ 1/ 1/", "2/ 2/ 2/", "3/ 3/ 3/", "1/ 2/ 3/", "E E"] }
  end
end
