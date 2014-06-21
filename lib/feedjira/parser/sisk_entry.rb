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

      # element :"epi:value", :as => :btn_text, :value => :text
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

  end
end
