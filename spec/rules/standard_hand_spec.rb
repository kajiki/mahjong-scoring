require "spec_helper"

describe Rules::StandardHand do
  subject { described_class }

  it "matches a standard hand with four pungs/kongs/chows and a pair" do
    should match_hand ["1• 1• 1•", "2/ 2/ 2/", "3• 3• 3•", "S S S", "4# 4#"]
    should match_hand ["1• 1• 1•", "2/ 2/ 2/ 2/", "3• 3• 3•", "S S S", "4# 4#"]
    should match_hand ["1/ 1/ 1/", "2/ 2/ 2/", "3/ 3/ 3/", "1/ 2/ 3/", "E E"]

    should_not match_hand ["1/ 1/", "7• 7•", "E E", "5# 5#", "S S", "B B", "F F"]
    should_not match_hand ["E E E E", "S S S", "3/ 3/"]
    should_not match_hand ["1/ 8# 2•", "1• 1• 1•", "2/ 2/ 2/", "3• 3• 3•", "S S S", "4# 4#"]
  end

end
