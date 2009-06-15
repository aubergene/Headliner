class Vote < ActiveRecord::Base

  belongs_to :article
  belongs_to :source

  validates_presence_of :source_id, :article_id

  def correct
    self.article.source == self.source
  end

  def result
    correct ? 'Correct' : 'Incorrect'
  end

end
