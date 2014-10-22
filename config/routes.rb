Rails.application.routes.draw do
  get 'google', to: 'crawlers#google', as: 'google'
  get 'facebook', to: 'crawlers#facebook', as: 'facebook'
  get 'twitter', to: 'crawlers#twitter', as: 'twitter'
  get 'flickr', to: 'crawlers#flickr', as: 'flickr'
  get 'youtube', to: 'crawlers#youtube', as: 'youtube'
  get 'amazon', to: 'crawlers#amazon', as: 'amazon'
  get 'itunes_store', to: 'crawlers#itunes_store', as: 'itunes_store'
  get 'google_play', to: 'crawlers#google_play', as: 'google_play'
  get 'search', to: 'crawlers#search', as: 'search'

  root 'welcome#index'
end
