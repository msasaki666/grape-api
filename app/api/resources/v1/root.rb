module Resources
  module V1
    class Root < Grape::API
      version 'v1'
      format :json
      content_type :json, 'application/json'

      # app/api/resources/v1/users.rbをマウント
      mount Resources::V1::Users

      # swaggerの設定
      if defined? GrapeSwaggerRails
        add_swagger_documentation(
          models: [
            Entities::V1::User,
          ]
        )
      end
    end
  end
end
