$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'tessitura'

require 'minitest/autorun'
require 'minitest-vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'test/cassettes'
  c.hook_into :webmock
end
