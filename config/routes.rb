Endive::Routing::Mapping::Mapper.build(Endive::Routing::Journey::TreeRouter::Router) do
  scope '/v1/catalog/fias/' do
    resources :cities, only: [:show, :index]
    resources :streets, only: [:show, :index]
    resources :regions, only: [:show, :index]
  end
end