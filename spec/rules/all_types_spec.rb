require "spec_helper"

describe Rules::AllTypes do
  subject { described_class }

  its(:score) { should == 16 }

  it "matches a standard hand with honors, terminals and all suits present" do
    should match_hand ["1/ 2/ 3/", "4• 4• 4•", "E E E", "C C C", "8# 8#"]
  end
  

  it "rejects if circles are missing" do
    should_not match_hand ["1/ 2/ 3/", "4/ 4/ 4/", "E E E", "C C C", "8# 8#"]
  end
  
  it "rejects if characters are missing" do
    should_not match_hand ["1/ 2/ 3/", "4• 4• 4•", "E E E", "C C C", "8• 8•"]
  end

  it "rejects if bamboos are missing" do
    should_not match_hand ["1• 2• 3•", "4# 4# 4#", "E E E", "C C C", "8# 8#"]
  end

  it "rejects if dragons are missing" do
    should_not match_hand ["1/ 2/ 3/", "4/ 4/ 4/", "E E E", "7• 7• 7•", "8# 8#"]
  end

  it "rejects if winds are missing" do
    should_not match_hand ["1/ 2/ 3/", "4• 4• 4•", "7# 7# 7#", "C C C", "8• 8•"]
  end

  it "rejects illegal hands" do
    should_not match_hand ["1/ 2/ 3/", "4• 4• 4•", "C C", "E E", "8# 8#"]
  end
end
