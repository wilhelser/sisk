require 'test_helper'
require 'split_rss_elem_to_key_value'

describe SplitRssElemToKeyValue do
  let(:rss_element_string) { '<epi:streetAddress value="5016 Teasley Lane" />' }
  describe "get_key(string)" do
    it "return the first half of the string split on space, minus the <epi:" do
      SplitRssElemToKeyValue.get_key(rss_element_string).must_equal "streetAddress"
    end
  end
  describe "get_value(key, string)" do
    it "returns everything after 'value' as key" do
      SplitRssElemToKeyValue.get_value(rss_element_string).must_equal "5016 Teasley Lane"
    end
  end
end
