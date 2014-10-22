Rails.application.routes.draw do
  get 'google', to: 'crawlers#google', as: 'google'
  get 'facebook', to: 'crawlers#facebook', as: 'facebook'
  get 'twitter', to: 'crawlers#twitter', as: 'twitter'
  get 'flickr', to: 'crawlers#flickr', as: 'flickr'
  get 'youtube', to: 'crawlers#youtube', as: 'youtube'
  get 'amazon', to: 'crawlers#amazon', as: 'amazon'
  get 'search', to: 'crawlers#search', as: 'search'
  get 'top', to: 'crawlers#top', as: 'top'
  get 'page_rank', to: 'crawlers#page_rank', as: 'page_rank'

  root 'welcome#index'
end
