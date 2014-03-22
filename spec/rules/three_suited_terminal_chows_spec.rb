require "spec_helper"

describe Rules::ThreeSuitedTerminalChows do
  subject { described_class }

  its(:score) { should == 16 }

  it "matches a standard hand of both terminal chows in two suits and a pair of fives in the third suit" do
    should match_hand ["1• 2• 3•", "7• 8• 9•", "1/ 2/ 3/", "7/ 8/ 9/", "5# 5#"]

    should_not match_hand ["1/ 2/ 3/", "7• 8• 9•", "1/ 2/ 3/", "7• 8• 9•", "5# 5#"]
    should_not match_hand ["1• 2• 3•", "7• 8• 9•", "1• 2• 3•", "7• 8• 9•", "5# 5#"]
    should_not match_hand ["1• 2• 3•", "7• 8• 9•", "1/ 2/ 3/", "7/ 8/ 9/", "5/ 5/"]
    should_not match_hand ["1• 2• 3•", "4• 4• 4•", "1/ 2/ 3/", "7/ 8/ 9/", "5# 5#"]
    should_not match_hand ["1• 2• 3•", "7• 8• 9•", "1/ 2/ 3/", "7/ 8/ 9/"]
  end
end
