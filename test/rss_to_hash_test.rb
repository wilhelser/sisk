require 'test_helper'
require 'rss_to_hash'

describe RssToHash do
  describe "get_rss(zipcode, distance, category)" do
    subject { RssToHash.get_rss('76210', 25, 25) }
    it "must return rss" do
      assert subject =~ /<epi:/
    end
  end

  describe "rss_to_hash(rss)" do
    subject { RssToHash.rss_to_hash(rss_fixture) }
    let(:rss_fixture) { File.read(
      File.expand_path("../fixtures/1401914342909-76210-25-25.rss", __FILE__))}
    it "must return a hash" do
      subject[0].must_equal(
        {"resultCount"=>"236", "redemption"=>"print", "printable"=>"10", "streetAddress"=>"5017 Teasley Lane #135", "city"=>"Denton", "state"=>"TX", "postalCode"=>"76210", "locationKey"=>"299104", "value"=>"Save", "distance"=>"0.9821880594299638", "validQualifier"=>"Valid at listed locations only|Not Valid with any other discounts or promotions", "daysOld"=>"0"}
      )
    end
  end

end
