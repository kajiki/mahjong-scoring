require "rspec"
require "mahjong_scoring"

RSpec.configure do |config|
  # Use color in STDOUT
  config.color_enabled = true

  # Use color not only in STDOUT but also in pagers and files
  config.tty = true
end

RSpec::Matchers.define :match_hand do |hand_spec|
  match do |rule|
    rule.match? Hand.new(hand_spec)
  end
end
