api_mine_type = %w(
application/vnd.api+json
text/x-json
application/json
)
Mine::Type.register ‘application/vnd.api+json’, :json, api_mine_types
