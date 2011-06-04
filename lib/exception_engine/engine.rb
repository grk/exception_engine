module ExceptionEngine
  class Engine < Rails::Engine
    engine_name "exception_engine"
    config.app_middleware.use "ExceptionEngine::ExceptionMiddleware"
  end
end
