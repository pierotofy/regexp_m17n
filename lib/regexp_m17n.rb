module RegexpM17N
  def self.non_empty?(str)
  	fail "Cannot check for empty string on a string with dummy encoding" if str.encoding.dummy?
	str =~ Regexp.new("^.$".encode(str.encoding))
  end
end