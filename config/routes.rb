Rails.application.routes.draw do
  post 'candidates/populate_candidates', to: 'candidates#populate_candidates', as: 'populate_candidates'
  resources :candidates
end
