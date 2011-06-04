ExceptionEngine::Engine.routes.draw do
  resources :exceptions, :only => [:index, :destroy]
end
