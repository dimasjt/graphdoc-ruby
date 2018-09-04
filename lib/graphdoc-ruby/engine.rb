module GraphdocRuby
  class Engine
    def self.call(env)
      @engine ||= new
      @engine.call(env)
    end

    def call(env)
      Rack::Builder.new do
        auth = GraphdocRuby.config.auth
        if auth && auth[:username] && auth[:password]
          use Rack::Auth::Basic do |username, password|
            auth[:username] == username && auth[:password] == password
          end
        end

        map '/' do
          run GraphdocRuby::Application
        end
      end.call(env)
    end
  end
end
