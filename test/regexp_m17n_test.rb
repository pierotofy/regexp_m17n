# encoding: utf-8
require 'minitest/autorun'
require_relative '../lib/regexp_m17n'

class RegexpTest < MiniTest::Unit::TestCase
  def test_non_empty_string
    Encoding.list.each do |enc|
=begin
	Per Yukihiro Matsumoto (matz): 

  	Dummy encodings are placeholders for encodings that cannot be handled
	properly by the current mechanism of Ruby M17N, probably due to their
	statefullness.  Example of those encoding is ISO-2022-JP.

	https://www.ruby-forum.com/topic/146448

	You can never get around calling str.encode('ISO-2022-JP')
	or any other dummy encoding for the matter.

	So this assertion needs to be rewritten, unless you want to monkey-patch
	encode to skip dummy encodings, but that's NOT a good practice.
=end
      assert(RegexpM17N.non_empty?('.'.encode(enc))) unless enc.dummy?
    end
  end
end
