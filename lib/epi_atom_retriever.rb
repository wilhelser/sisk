require 'rubygems'
require 'bundler/setup'
require 'httparty'
require 'thread'

module EpiAtomRetriever
  extend self

  def get_atom(zipcode, distance, categories)
    assert_server_has_curl
    resource_url = resource_url_with_params(zipcode, distance, categories)

    atom_pages, current_count = [], 25

    puts "Getting initial resultset"
    atom = atom_retriever(resource_url)
    number_of_records = result_count(atom)
    number_of_records > 250 ? total_records = 250 : total_records = number_of_records
    records_left = total_records
    puts "Gathered some atom, there are still #{records_left} left to go"
    atom_pages << atom

    while records_left > 0
      puts "Getting paged resultset"
      atom = atom_retriever(paged_url(resource_url, current_count))
      puts "Gathered some atom, there are still #{records_left} left to go"
      records_left = total_records - current_count
      current_count = current_count + 25
      puts current_count
      atom_pages << atom
      sleep 0.25
    end

    atom_pages
  end
  alias_method :call, :get_atom

private

  def paged_url(url, count)
    [url, "start-index=#{count}"].join("&")
  end

  def result_count(atom)
    atom.match(/resultCount count="(\d+)"/)[1].to_i
  end

  def resource_url_with_params(zipcode, distance, categories)
    [base_url, resource_params(zipcode, distance, categories)].join("?")
  end

  def resource_params(zipcode, distance, categories)
    ["location=#{zipcode}",
     "distance=#{distance}",
     *build_categories_params(categories)
    ].join("&")
  end

  def build_categories_params(categories)
    categories.map {|cat| "category=#{cat}" }
  end

  def assert_server_has_curl
    return unless `which curl` == ""
    raise "You need to install curl on this server"
  end

  def atom_retriever(url)
    assert_server_has_curl
    `curl --user #{basic_auth} #{url}`
  end

  def base_url
    "http://api.entertainment.com/AtomServer3/feeds/offers?uuid=#{@current_uuid}"
  end

  def basic_auth
    "INFO@SISK.COM:T1aPw4SjF"
  end

end

