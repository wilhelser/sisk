require 'feedjira'
require 'feedjira/parser/sisk_entry'

module Feedjira
  module Parser

    class SiskEntry
      include SAXMachine
      include FeedEntryUtilities

      element :title
      element :link, :as => :url, :value => :href, :with => {:type => "text/html", :rel => "alternate"}
      element :name, :as => :author
      element :content
      element :summary

      element :"media:content", :as => :image, :value => :url
      element :enclosure, :as => :image, :value => :href

      element :published
      element :id, :as => :entry_id
      element :created, :as => :published
      element :issued, :as => :published
      element :updated
      element :modified, :as => :updated
      elements :category, :as => :categories, :value => :term
      elements :link, :as => :links, :value => :href

      element :"epi:rating", :as => :rating, :value => :value
      element :"epi:redemption", :as => :redemption, :value => :method
      element :"epi:printable", :as => :printable, :value => :count
      element :"epi:streetAddress", :as => :street_address, :value => :value
      element :"epi:city", :as => :city, :value => :value
      element :"epi:state", :as => :state, :value => :value
      element :"epi:postalCode", :as => :postal_code, :value => :value
      element :"epi:locationKey", :as => :location_key, :value => :value
      element :"epi:distance", :as => :distance, :value => :miles
      element :"epi:daysOld", :as => :days_ol, :value => :valued
      element :"epi:validQualifier", :as => :valid_qualifier, :value => :value

      def url
        @url ||= links.first
      end
    end

    class Sisk
      include SAXMachine
      include FeedUtilities
      element :title
      element :subtitle, :as => :description
      element :link, :as => :url, :value => :href, :with => {:type => "text/html"}
      element :link, :as => :feed_url, :value => :href, :with => {:rel => "self"}
      elements :link, :as => :links, :value => :href
      elements :link, :as => :hubs, :value => :href, :with => {:rel => "hub"}
      elements :entry, :as => :entries, :class => ::Feedjira::Parser::SiskEntry

      def self.able_to_parse?(xml) #:nodoc:
        /\<feed[^\>]+xmlns\s?=\s?[\"|\'](http:\/\/www\.w3\.org\/2005\/Atom|http:\/\/purl\.org\/atom\/ns\#)[\"|\'][^\>]*\>/ =~ xml
      end

      def url
        @url || (links - [feed_url]).last || links.last
      end

      def feed_url
        @feed_url ||= links.first
      end

      def self.preprocess(xml)
        Preprocessor.new(xml).to_xml
      end
    end
  end

end
