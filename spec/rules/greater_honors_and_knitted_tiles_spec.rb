require "spec_helper"

describe Rules::GreaterHonorsAndKnittedTiles do
  subject { described_class }

  its(:score) { should == 24 }

  it "matches a 14 tile hand with 5 single tiles from knitted sets of all types and 7 single honor tiles" do
    should match_hand ["6/ 3/ 9/ 8• 5• 2• 4# 東 南 西 北 中 發 白"]
    should match_hand ["1# 4# 7#", "南 東 發 2/ 8/ 3• 白 6• 北 中 西"]
  end

  it "rejects a hand with too few honor tiles" do
    should_not match_hand ["6/ 3/ 9/ 8• 5• 2• 4# 7# 南 西 北 中 發 白"]
  end

  it "rejects a hand with duplicated tiles, types or ranks" do
    should_not match_hand ["7/ 4/ 1/", "5/ 2/ 8/", "3# 6# 9#", "東 南 西 中 發"]
    should_not match_hand ["1# 4# 7#", "南 東 發 2/ 8/ 3• 白 6• 北 北 西"]
    should_not match_hand ["2/ 5/ 8/ 8• 5• 2• 4# 東 南 西 北 中 發 白"]
  end

  it "rejects invalid sequences" do
    should_not match_hand ["8/ 3/ 9/ 6• 5• 2• 4# 東 南 西 北 中 發 白"]
  end

  it "rejects invalid hands" do
    should_not match_hand ["6/ 3/ 9/ 8• 5• 2• 東 南 西 北 中 發 白"]
  end
end
