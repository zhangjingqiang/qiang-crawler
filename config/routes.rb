Rails.application.routes.draw do
  # Crawler
  get 'google', to: 'crawlers#google', as: 'google'
  get 'facebook', to: 'crawlers#facebook', as: 'facebook'
  get 'twitter', to: 'crawlers#twitter', as: 'twitter'
  get 'flickr', to: 'crawlers#flickr', as: 'flickr'
  get 'youtube', to: 'crawlers#youtube', as: 'youtube'
  get 'amazon', to: 'crawlers#amazon', as: 'amazon'
  # Search
  get 'search', to: 'search#index', as: 'search'
  # Top 10
  get 'top', to: 'top#index', as: 'top'
  # Page rank
  get 'page_rank', to: 'page_rank#index', as: 'page_rank'

  root 'welcome#index'
end
