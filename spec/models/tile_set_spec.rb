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

describe TileSet, ".wrap" do
  describe "with a TileSet" do
    it "returns the same TileSet" do
      tile_set = TileSet.new("E E")
      TileSet.wrap(tile_set).should === tile_set
    end
  end

  describe "with a Tile array" do
    it "returns a new TileSet" do
      tiles = [Tile.new("1/"), Tile.new("1/"), Tile.new("1/")]
      TileSet.wrap(tiles).should == TileSet.new(tiles)
    end
  end

  describe "with a string" do
    it "returns a new TileSet" do
      tiles = "1/ 1/ 1/"
      TileSet.wrap(tiles).should == TileSet.new(tiles)
    end
  end
end

describe TileSet, "#type" do
  it "is :pair for two identical tiles" do
    TileSet.new("8/ 8/").type.should == :pair
    TileSet.new("8/ 9/").type.should_not == :pair
    TileSet.new("8/ 8•").type.should_not == :pair
  end

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

describe TileSet, "comparisons" do
  it "is equal when the tiles have the same value" do
    TileSet.new("2/ 2/").should == TileSet.new("2/ 2/")
    TileSet.new("2/ 2/").should_not == TileSet.new("3/ 3/")
  end
end
