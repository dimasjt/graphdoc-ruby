require 'graphdoc_ruby'

GraphdocRuby.configure do |config|
  # Pokemon
  config.endpoint = 'https://graphql-pokemon.now.sh/'

  # Github
  # config.endpoint = 'https://api.github.com/graphql'
  # config.graphql_context = -> {
  #   {
  #     'Authorization' => "bearer XXXXXXX",
  #     'User-Agent' => 'my-client',
  #   }
  # }

  config.auth = {
    username: 'username',
    password: 'password'
  }
end

run(GraphdocRuby::Engine)
