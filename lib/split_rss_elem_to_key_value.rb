module SplitRssElemToKeyValue
  extend self

  def get_key(string)
    string.scan(/epi:(\w+)/).flatten[0]
  end

  def get_value(string)
    string.scan(/\"(.*)\"/).flatten[0]
  end
end
