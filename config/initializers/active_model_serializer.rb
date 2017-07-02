# api_mine_type = %w(
# application/vnd.api+json
# text/x-json
# application/json
# )
# Mine::Type.register ‘application/vnd.api+json’, :json, api_mine_types


api_mime_types = %W(
  application/vnd.api+json
  text/x-json
  application/json
)

Mime::Type.unregister :json
Mime::Type.register 'application/json', :json, api_mime_types
