guard :rspec do
  watch(%r{^lib/mahjong_scoring/(.*)\.rb}) { |s| "spec/#{s[1]}_spec.rb" }
  watch(%r{^spec/(.*)_spec\.rb})
  watch(%r{^spec/spec_helper\.rb}) { 'spec' }
end
