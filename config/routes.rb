Rails.application.routes.draw do
  resources :sites
  match '', to: 'sites#show', constraints: lambda { |r| r.subdomain.present? && r.subdomain != 'www' }, via: [:get, :post]
  root 'sites#index'
end
