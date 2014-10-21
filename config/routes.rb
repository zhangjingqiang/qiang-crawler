Rails.application.routes.draw do
  get 'google', to: 'crawlers#google', as: 'google'
  get 'facebook', to: 'crawlers#facebook', as: 'facebook'
  get 'twitter', to: 'crawlers#twitter', as: 'twitter'
  get 'itunes_store', to: 'crawlers#itunes_store', as: 'itunes_store'
  get 'google_play', to: 'crawlers#google_play', as: 'google_play'
  get 'amazon', to: 'crawlers#amazon', as: 'amazon'
  get 'keyword', to: 'crawlers#keyword', as: 'keyword'
  get 'stock', to: 'crawlers#stock', as: 'stock'

  root 'welcome#index'
end
