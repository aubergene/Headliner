ActionController::Routing::Routes.draw do |map|

  map.root :controller => 'articles'
  map.article 'article/:id', :controller => 'articles', :action => 'show'
  map.vote 'vote', :controller => 'articles', :action => 'vote'
  map.result 'result/:id', :controller => 'articles', :action => 'result'

  map.hello 'hello', :controller => 'articles', :action => 'hello'
end
