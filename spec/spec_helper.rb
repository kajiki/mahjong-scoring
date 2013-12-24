require "minitest/autorun"
require "minitest/pride"
require "mahjong_scoring"

module MiniTest::Assertions
  def assert_rule_matches(_, rule)
    assert rule.match? == true, "Expected #{rule.to_s} to match but it did not"
  end

  def assert_rule_does_not_match(_, rule)
    assert rule.match? == false, "Expected #{rule.to_s} not to match but it did"
  end
end

MahjongScoring::Rule.infect_an_assertion :assert_rule_matches, :must_match
MahjongScoring::Rule.infect_an_assertion :assert_rule_does_not_match, :must_not_match
