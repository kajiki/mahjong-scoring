require "spec_helper"

describe Rules::DragonPung do
  subject { described_class }

  its(:score) { should == 2 }

  it "matches a standard hand with a dragon pung/kong" do
    should match_hand ["2# 2# 2#", "F F F", "5# 5# 5#", "1• 2• 3•", "4/ 4/"]
    should match_hand ["2# 2# 2#", "B B B B", "5# 5# 5#", "1• 2• 3•", "4/ 4/"]

    should_not match_hand ["6# 6# 6# 6#", "3/ 3/ 3/", "5# 5# 5#", "1• 2• 3•", "S S"]
    should_not match_hand ["6# 6# 6# 6#", "F F F", "1• 2• 3•", "3• 3•"]
  end
end
