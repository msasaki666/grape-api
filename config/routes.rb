Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  mount API => '/'
  # mount GrapeSwaggerRails::Engine => '/docs' if defined? GrapeSwaggerRails
end
