require 'hpricot'
require 'open-uri'
require 'time'

class Source < ActiveRecord::Base

  has_many :articles
  has_many :votes

  validates_presence_of :name, :website

  def import_articles
    puts "Importing articles for #{name}"
    imported = 0
    doc = Hpricot.XML(open(feed_url))
    (doc/"item").each do |item|
      begin
        guid = (item/"guid").inner_text

        article = Article.find_or_create_by_guid(guid)
        article.source = self
  #      guid = (item/"guid").inner_text.strip
        article.title = (item/"title").inner_text.strip
        article.link = (item/"link").inner_text.strip
        article.pub_date = Time.parse((item/"pubDate").inner_text)
        imported += 1 if article.new_record?
        article.save!
        if imported == 15
          break
        end
      rescue
        warn "Could not import #{$!}"
      end
    end
    puts "Imported #{imported} article(s)"
  end

end
