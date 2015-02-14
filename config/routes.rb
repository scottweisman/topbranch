Rails.application.routes.draw do
  resources :sites
  match '', to: 'sites#show', constraints: lambda { |r| r.subdomain.present? && r.subdomain != 'www' }, via: [:get, :post]
  root 'sites#index'

  comfy_route :cms_admin, :path => '/admin'
  # Make sure this routeset is defined last
  comfy_route :cms, :path => '/', :sitemap => false
end
