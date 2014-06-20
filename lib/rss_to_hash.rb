require 'rubygems'
require 'bundler/setup'
require 'httparty'

module RssToHash
  extend self

  def get_rss(zipcode, distance, category)
    assert_server_has_curl
    rss_retriever("#{base_url}&location=#{zipcode}&" +
                  "distance=#{distance}&category=#{category}",
                  basic_auth_hash)
  end

  def rss_to_hash(rss)
    epi_array_from(rss).map do |entry|
      Hash[entry.map do |epi|
        splitter = SplitRssElemToKeyValue
        [splitter.get_key(epi), splitter.get_value(epi)]
      end]
    end
  end

private

  def epi_array_from(rss)
    entries = extract_entries_from(rss)
    entries.map do |entry|
      entry.split("\r\n").select {|string| string =~ /<epi:/ }
    end
  end


  def extract_entries_from(rss)
    rss.split("</entry>")
  end

  def assert_server_has_curl
    return unless `which curl` == ""
    raise "You need to install curl on this server"
  end

  def rss_retriever(url, auth)
    HTTParty.get(url, auth)
  end

  def base_url
    "http://api.entertainment.com/AtomServer3/feeds/offers?uuid=1401914342909"
  end

  def basic_auth_hash
    { basic_auth: { username: "INFO@SISK.COM", password: "T1aPw4SjF" } }
  end

end

