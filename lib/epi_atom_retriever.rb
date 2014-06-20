require 'rubygems'
require 'bundler/setup'
require 'httparty'

module EpiAtomRetriever
  extend self

  def get_atom(zipcode, distance, category)
    assert_server_has_curl
    rss_retriever("#{base_url}&location=#{zipcode}&" +
                  "distance=#{distance}&category=#{category}",
                  basic_auth_hash)
  end
  alias_method :call, :get_atom

private

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

