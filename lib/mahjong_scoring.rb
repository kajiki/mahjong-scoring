require "mahjong_scoring/version"

module MahjongScoring

end

library_root = File.dirname(__FILE__)
Dir[File.join library_root, "mahjong_scoring/models/**/*.rb"].each { |f| puts f; require f }

require File.join library_root, "mahjong_scoring/rules/standard_hand.rb"
Dir[File.join library_root, "mahjong_scoring/rules/**/*.rb"].each { |f| puts f; require f }
