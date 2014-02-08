require "spec_helper"

shared_examples_for "suited tile" do |options|
  (1..9).each do |rank|
    describe "rank #{rank}" do
      subject(:tile) { Tile.new("#{rank}#{options[:suit]}") }

      its(:type) { should == options[:expected_type] }
      its(:rank) { should == rank }
      it { should_not be_honor }
      it { should_not be_dragon }
      it { should_not be_wind }
    end
  end

  it "rejects invalid ranks" do
    expect { Tile.new("0#{options[:suit]}") }.to raise_error(ArgumentError)
    expect { Tile.new(" #{options[:suit]}") }.to raise_error(ArgumentError)
    expect { Tile.new("X#{options[:suit]}") }.to raise_error(ArgumentError)
  end

  it "is terminal when rank is 1 or 9" do
    Tile.new("1#{options[:suit]}").should be_terminal
    Tile.new("9#{options[:suit]}").should be_terminal
    Tile.new("5#{options[:suit]}").should_not be_terminal
  end
end

describe "Bamboo tile" do
  it_behaves_like "suited tile", suit: "/", expected_type: :bamboo
end

describe "Character tile" do
  it_behaves_like "suited tile", suit: "#", expected_type: :character
end

describe "Circle tile" do
  it_behaves_like "suited tile", suit: "•", expected_type: :circle
end



shared_examples_for "honor tile" do |options|
  subject { Tile.new(options[:symbol]) }

  its(:rank) { should be_nil }
  its(:type) { should == options[:expected_type] }
  it { should_not be_terminal }
  it { should be_honor }
end

shared_examples_for "dragon tile" do |options|
  subject { Tile.new(options[:symbol]) }

  it_behaves_like "honor tile", options
  it { should be_dragon }
  it { should_not be_wind }
end

shared_examples_for "wind tile" do |options|
  subject { Tile.new(options[:symbol]) }

  it_behaves_like "honor tile", options
  it { should be_wind }
  it { should_not be_dragon }
end


describe "White Dragon tile" do
  it_behaves_like "dragon tile", symbol: "B", expected_type: :white_dragon
  it_behaves_like "dragon tile", symbol: "白", expected_type: :white_dragon
end

describe "Red Dragon tile" do
  it_behaves_like "dragon tile", symbol: "C", expected_type: :red_dragon
  it_behaves_like "dragon tile", symbol: "中", expected_type: :red_dragon
end

describe "Green Dragon tile" do
  it_behaves_like "dragon tile", symbol: "F", expected_type: :green_dragon
  it_behaves_like "dragon tile", symbol: "發", expected_type: :green_dragon
end

describe "East Wind tile" do
  it_behaves_like "wind tile", symbol: "E", expected_type: :east_wind
  it_behaves_like "wind tile", symbol: "東", expected_type: :east_wind
end

describe "South Wind tile" do
  it_behaves_like "wind tile", symbol: "S", expected_type: :south_wind
  it_behaves_like "wind tile", symbol: "南", expected_type: :south_wind
end

describe "West Wind tile" do
  it_behaves_like "wind tile", symbol: "W", expected_type: :west_wind
  it_behaves_like "wind tile", symbol: "西", expected_type: :west_wind
end

describe "North Wind tile" do
  it_behaves_like "wind tile", symbol: "N", expected_type: :north_wind
  it_behaves_like "wind tile", symbol: "北", expected_type: :north_wind
end
