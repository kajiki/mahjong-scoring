require "spec_helper"

describe Hand, "constructor" do
  it "accepts an array of tilesets" do
    tilesets_in_hand = [TileSet.new("1/ 1/ 1/"), TileSet.new("2/ 2/ 2/"), TileSet.new("3/ 3/ 3/")]
    Hand.new(tilesets_in_hand).tilesets.should == tilesets_in_hand
  end

  it "accepts an array of strings" do
    tilesets_in_hand = ["1/ 1/ 1/", "2/ 2/ 2/", "3/ 3/ 3/"]
    Hand.new(tilesets_in_hand).tilesets.should == [
      TileSet.new("1/ 1/ 1/"), TileSet.new("2/ 2/ 2/"), TileSet.new("3/ 3/ 3/")
    ]
  end
end

describe Hand do
  it "can return all pung tilesets" do
    Hand.new(["1/ 1/ 1/", "2/ 2/ 2/", "3# 4# 5#"]).pungs.should == [
      TileSet.new("1/ 1/ 1/"), TileSet.new("2/ 2/ 2/")
    ]
  end

  it "can return all kong tilesets" do
    Hand.new(["1• 1• 1• 1•", "2• 2• 2• 2•", "3• 3• 3•", "3• 4• 5•"]).kongs.should == [
      TileSet.new("1• 1• 1• 1•"), TileSet.new("2• 2• 2• 2•")
    ]
  end

  it "can return all chow tilesets" do
    Hand.new(["1# 1# 1#", "2# 2# 2#", "4# 5# 6#", "7# 8# 9#"]).chows.should == [
      TileSet.new("4# 5# 6#"), TileSet.new("7# 8# 9#")
    ]
  end
  
  it "can return all pair tilesets" do
    Hand.new(["1• 1• 1•", "2• 2•"]).pairs.should == [TileSet.new("2• 2•")]
  end
end
