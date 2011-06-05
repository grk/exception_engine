module ExceptionEngine
  class Engine < Rails::Engine
    engine_name "exception_engine"

    config.app_middleware.use "ExceptionEngine::ExceptionMiddleware"

    initializer "exception_engine_mongoid_initializer" do |app|
      unless File.exist?(app.root.join('config', 'mongoid.yml'))
        Mongoid.configure do |config|
          name = "exception_engine-#{Rails.env}"
          host = "localhost"
          config.master = Mongo::Connection.new.db(name)
          config.persist_in_safe_mode = false
        end
      end
    end
  end
end
