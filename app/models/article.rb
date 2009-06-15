class Article < ActiveRecord::Base

  belongs_to :source
  has_many :votes

  validates_presence_of :source_id, :guid, :title, :link, :pub_date

  def filtered_title
    tmp = title
    tmp.sub(/^[A-Z ]{2,}: /,'')
  end

  def self.random
    Article.find(:first, :order=>'RAND()')
  end

end
