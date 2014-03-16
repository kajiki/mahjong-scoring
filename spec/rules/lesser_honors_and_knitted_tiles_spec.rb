require "spec_helper"

describe Rules::LesserHonorsAndKnittedTiles do
  subject { described_class }

  its(:score) { should == 12 }

  it "matches a 14 tile hand with up to 9 single tiles from knitted sequences of all types and any single honor tiles" do
    should match_hand ["7• 4• 1•", "5/ 2/ 8/", "3# 6# 9#", "東 南 西 中 發"]
    should match_hand ["1/ 4/ 7/", "8# 2# 5#", "中 發", "3• 6• 東 南 西 白"]
    should match_hand ["1# 4# 2• 北 5• 8• 9/ 東 南 3/ 6/ 白 中 發"]
  end

  it "rejects a hand with duplicated tiles, types or ranks" do
    should_not match_hand ["7/ 4/ 1/", "5/ 2/ 8/", "3# 6# 9#", "東 南 西 中 發"]
    should_not match_hand ["1# 4# 7#", "南 東 發 2/ 8/ 3• 白 6• 北 北 西"]
    should_not match_hand ["2/ 5/ 8/ 8• 5• 2• 4# 7# 南 西 北 中 發 白"]
  end

  it "rejects invalid sequences" do
    should_not match_hand ["8/ 3/ 9/ 6• 5• 2• 4# 7# 南 西 北 中 發 白"]
  end

  it "rejects invalid hands" do
    should_not match_hand ["6/ 3/ 9/ 8• 5• 2• 1# 南 西 北 中 發 白"]
  end
end
