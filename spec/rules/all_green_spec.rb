require "spec_helper"

describe Rules::AllGreen do
  subject { described_class }

  its(:score) { should == 88 }

  it "matches a standard hand with all green tiles" do
    should match_hand ["2/ 2/ 2/ 2/", "4/ 4/ 4/", "6/ 6/ 6/", "8/ 8/ 8/", "發 發"]

    should_not match_hand ["2/ 2/ 2/ 2/", "4/ 4/ 4/", "6/ 6/ 6/", "8/ 8/ 8/", "9/ 9/"]
    should_not match_hand ["2/ 2/ 2/ 2/", "4/ 4/ 4/", "6/ 6/ 6/", "8/ 8/ 8/"]
  end
end

