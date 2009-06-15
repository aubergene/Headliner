namespace :import do

#  task(:reset => [:environment, :db:migrate:reset, :db:fixtures:load, :rss]

  task(:rss => [:environment]) do
    Article.delete_all # TODO just for testing
    Source.all.each do |s|
      s.import_articles
    end
  end


end
