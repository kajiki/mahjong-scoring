module MahjongScoring
  module Rules
    class NineGates < MahjongScoring::Rule
      def initialize(tiles)
        @tiles = tiles
      end

      def match?
        case @tiles
        when %w[1● 1● 1● 2● 3● 4● 5● 6● 7● 8● 9● 9● 9●] then true
        when %w[1/ 1/ 1/ 2/ 3/ 4/ 5/ 6/ 7/ 8/ 9/ 9/ 9/] then true
        when %w[1# 1# 1# 2# 3# 4# 5# 6# 7# 8# 9# 9# 9#] then true
        else false
        end
      end
    end
  end
end