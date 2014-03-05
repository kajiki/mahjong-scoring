require "spec_helper"

describe Rules::AllSimples do
  subject { described_class }

  its(:score) { should == 2 }

  it "matches a standard hand with no honor or terminal tiles" do
    should match_hand ["3/ 4/ 5/", "6• 6• 6•", "7# 7# 7#", "6/ 7/ 8/", "2# 2#"]

    should_not match_hand ["3/ 4/ 5/", "N N N", "7# 7# 7#", "6/ 7/ 8/", "2# 2#"]
    should_not match_hand ["3/ 4/ 5/", "9 9 9", "7# 7# 7#", "6/ 7/ 8/", "2# 2#"]
    should_not match_hand ["3/ 4/ 5/", "6• 6• 6•", "7# 7# 7#", "2# 2#"]
  end
end
