require "spec_helper"

describe TileSet, "constructor" do
  it "accepts an array of tiles" do
    tiles_in_set = [Tile.new("3/"), Tile.new("3/"), Tile.new("3/")]
    TileSet.new(tiles_in_set).tiles.should == tiles_in_set
  end

  it "accepts a string of tiles" do
    tiles_in_set = "6# 6# 6#"
    TileSet.new(tiles_in_set).tiles.should == [
      Tile.new("6#"), Tile.new("6#"), Tile.new("6#")
    ]
  end
end

describe TileSet, "#type" do
  it "is :pung for three identical tiles" do
    TileSet.new("8/ 8/ 8/").type.should == :pung
    TileSet.new("8/ 8/ 9/").type.should_not == :pung
    TileSet.new("8/ 8/ 8•").type.should_not == :pung
  end
  
  it "is :kong for four identical tiles" do
    TileSet.new("8/ 8/ 8/ 8/").type.should == :kong
    TileSet.new("8/ 8/ 8/ 9/").type.should_not == :kong
    TileSet.new("8/ 8/ 8/ 8#").type.should_not == :kong
  end

  it "is :chow for three consecutive tiles" do
    TileSet.new("2# 1# 3#").type.should == :chow
    TileSet.new("1# 1# 3#").type.should_not == :chow
    TileSet.new("1# 2# 3•").type.should_not == :chow
  end
end